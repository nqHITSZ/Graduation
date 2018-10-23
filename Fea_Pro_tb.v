`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/06 16:16:36
// Design Name: 
// Module Name: Brief_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Fea_Pro_tb();

localparam PERIOD=10;//100MHz
localparam Tc2o=1;//clock to output delay
reg clk,rst;


integer row_cnt,col_cnt;


reg [7:0] din;
reg din_valid;
wire dout_valid;





//generate clock
initial begin
    clk = 1'b0;
    #(PERIOD/2);
    forever
     #(PERIOD/2) clk = ~clk;
end


wire [147:0] des_coor;
wire feature_flag;
wire [63:0] dout_data;
wire done;

wire [9:0]Lx,Ly,Rx,Ry,Px,Py;
assign Lx = dout_data[19:10];
assign Ly = dout_data[09:00];
assign Rx = dout_data[59:50];
assign Ry = dout_data[49:40];
assign Px = dout_data[39:30];
assign Py = dout_data[29:20];


Fea_Pro #(
    .Img_Height(100),//image height
    .Img_Width(120),//image width
    .Surf_Threshold(32'h64000),
    .Hamming_Threshold(125)
)
DUT
(
    .clk(clk),
    .rst(rst),
    .img_din(din),
    .img_din_valid(din_valid),   
    .dout_valid(dout_valid),
    .dout_data(dout_data),
    .done(done)
);





wire [9:0] ref_row_cnt,ref_col_cnt;
wire [127:0] descriptor;

assign ref_col_cnt = des_coor[147:138];
assign ref_row_cnt = des_coor[137:128];
assign descriptor = des_coor[127:0];

/*
CoordinateGen#
(
    .ROW(150),
    .COL(100)
)
CG_u
(
    .clk(clk),
    .rst(rst),
    .din_valid(dout_valid),
    .col_cnt(ref_col_cnt),//x
    .row_cnt(ref_row_cnt)//y
);
*/

integer fpWD;

initial begin
    rst = 1'b1;
    row_cnt = 0;
    col_cnt = 0;
    din = 8'bx;
    din_valid = 0;
    #(PERIOD*50);
    @(posedge clk);//for sync with clock;
    rst <= #(Tc2o) 0;
    #(PERIOD*50);

    //getData("image_data.mem");
    
    getData("./CONES/mem/1L.txt");
    #(PERIOD*100);
    getData("./CONES/mem/1R.txt");
    #(PERIOD*100);
    getData("./CONES/mem/2L.txt");
    #(PERIOD*100);
    getData("./CONES/mem/2R.txt");
    #(PERIOD*100);
    getData("./CONES/mem/3L.txt");
    #(PERIOD*100);
    getData("./CONES/mem/3R.txt");
    #(PERIOD*100);
    getData("./CONES/mem/4L.txt");
    #(PERIOD*100);
    getData("./CONES/mem/4R.txt");
    #(PERIOD*100);
    getData("./CONES/mem/5L.txt");
    #(PERIOD*100);
    getData("./CONES/mem/5R.txt");
    #(PERIOD*100);
    getData("./CONES/mem/6L.txt");
    #(PERIOD*100);
    getData("./CONES/mem/6R.txt");
    #(PERIOD*100);
    getData("./CONES/mem/7L.txt");
    #(PERIOD*100);
    getData("./CONES/mem/7R.txt");
    #(PERIOD*100);
    getData("./CONES/mem/8L.txt");
    #(PERIOD*100);
    getData("./CONES/mem/8R.txt");
    #(PERIOD*100);
    getData("./CONES/mem/9L.txt");
    #(PERIOD*100);
    getData("./CONES/mem/9R.txt");
    #(PERIOD*100);

    #(PERIOD*200);
    $display( "END");
    

end

initial begin

    #(8*430*1000);
    $fclose(fpWD);
    $stop;


end


///////////////////////////// WriteData begin

task WriteData;
input [128*8-1:0] filename;
begin
    fpWD = $fopen(filename,"w");
    if (!fpWD)
        $display("Could not open the file");
    else
        $display("Open Successfully\n");
              
    $fwrite(fpWD,"@0000\n");
    forever begin
        @(posedge clk)
            if(feature_flag)
                $fwrite(fpWD,"%x //(%3d,%3d)\n",des_coor,ref_col_cnt,ref_row_cnt);
    end
end
endtask

initial begin
    WriteData("F:/detection_description/temp.txt");
end
///////////////////////////// WriteData end

initial begin
    DisplayData();
end

task DisplayData;
begin
    forever begin
        @(posedge clk)
            if(dout_valid) begin
                //$display("hello\n");
                $display( "(%3d,%3d)---(%3d,%3d)-----Parallax:(%3d,%3d)", Lx, Ly, Px, Py, Rx, Ry );
            end
            if(done) begin
                $display("####################################################################");
            end
    end
end
endtask


task getData;
    input [64*8-1:0] filename;
    integer fp,code;
    integer ROW, COL;
    integer din_temp;
    begin
    
    fp = $fopen(filename,"r");
    code=$fscanf(fp,"COL=%d\n",COL);
    code=$fscanf(fp,"ROW=%d\n",ROW);
         
    repeat(1000)  begin
        @(posedge clk)
            din_valid <= #(Tc2o) 0;
    end 
    
    
    while(!$feof(fp))
    begin
        @(posedge clk)
            code=$fscanf(fp,"%d",din_temp);
            din <= #(Tc2o) din_temp;
            din_valid <= #(Tc2o) 1;
            
            if(!din_valid) begin
                row_cnt <= #(Tc2o)0;
                col_cnt <= #(Tc2o)0;
            end
            else begin
                col_cnt <= #(Tc2o) (col_cnt==COL-1)? 0 : col_cnt + 1; 
                if(col_cnt==COL-1)
                    row_cnt <= #(Tc2o)  (row_cnt==ROW-1)? 0 : row_cnt + 1;
            end
    end
    din_valid <= #(Tc2o) 1'b0;
    
    $fclose(fp);    
    
    end

endtask

task getData2;
    reg [7:0] data_temp;
    integer ROW, COL;
    integer i;
    begin
        ROW=480;
        COL=640;
        repeat(1000)  begin
            @(posedge clk)
                din_valid <= #(Tc2o) 0;
        end
        
        for(i=0;i<480*640;i=i+1) begin
            @(posedge clk)
                din_valid <= #(Tc2o) 1;
                din <= #(Tc2o) 8'd255;
                               
                if(!din_valid) begin
                    row_cnt <= #(Tc2o)0;
                    col_cnt <= #(Tc2o)0;
                end
                else begin
                    col_cnt <= #(Tc2o) (col_cnt==COL-1)? 0 : col_cnt + 1; 
                    if(col_cnt==COL-1)
                        row_cnt <= #(Tc2o)  (row_cnt==ROW-1)? 0 : row_cnt + 1;
                end
                
        end
        @(posedge clk)
            din_valid <= #(Tc2o) 1'b0;
    end  
endtask





endmodule

