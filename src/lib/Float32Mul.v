//////////////////////////////////////////////////////////////////
//                                                             
// Copyright (C) 2009 Pulse Logic
//                    info@pulselogic.com.pl                   
//                                                             
// This source file may be used and distributed without        
// restriction provided that this copyright statement is not   
// removed from the file and that any derivative work contains 
// the original copyright notice and the associated disclaimer.
//                                                             
//     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   
// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   
// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      
// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   
// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  
// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  
// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         
// POSSIBILITY OF SUCH DAMAGE.                                 
//                                                             
//////////////////////////////////////////////////////////////////
//
// Title       : Float32Mul
// Design      : Float32 RTL Library
// Company     : Pulse Logic
//
//////////////////////////////////////////////////////////////////
//
// File        : Float32Mul.v
// Tool        : Xilinx WebPack
//
//////////////////////////////////////////////////////////////////
//
// Description : IEEE 754 single precision synchronous floating point multiplier.
//				 Obfuscated code. 
//////////////////////////////////////////////////////////////////

module Float32Mul (CLK, nRST, leftArg, rightArg, loadArgs, status, busy, product);
input CLK;              //Global clock. Rising edge active. 
input nRST;             //Global reset. Active low. 
input [31:0] leftArg;   //Left argument. Bit 31 - sign, Bits 30:23 exponent, Bits 22:0 mantissa. 
input [31:0] rightArg;  //Right argument. Bit 31 - sign, Bits 30:23 exponent, Bits 22:0 mantissa. 
input loadArgs;         //Arguments load strobe. Active high. 
output [2:0] status;    //Status output. Bit 2 - Not a Number, Bit 1 - Infinity, Bit 0 - Denormal. 
output busy;            //busy - high means performing calculations, low means result ready.
output [31:0] product;  //Result. Valid if busy bit is low. Status bits 2:0 denote exceptions. 

wire[31:0]product;wire[2:0]status;wire busy;reg IOOOO1;wire I0OOO1,IIOOO1;reg IlOOO1;wire I1OOO1,IOO0O1;reg I0O0O1;wire IIO0O1,IlO0O1;reg [9:0]I1O0O1;reg [9:0]IOOIO1;wire I0OIO1;reg [47:0]IIOIO1;wire[47:0
]IlOIO1;wire I1OIO1;reg IOOlO1;wire I0OlO1,IIOlO1;reg [31:0]IlOlO1;wire[31:0]I1OlO1;wire IOO1O1;reg [7:0]I0O1O1;wire[7:0]IIO1O1;wire IlO1O1;reg I1O1O1;wire IOOO01,I0OO01;reg [23:0]IIOO01;wire[23:0]IlOO01;wire
I1OO01;reg IOO001;wire I0O001,IIO001;reg [4:0]IlO001;wire[4:0]I1O001;wire IOOI01;reg [31:0]I0OI01;wire[31:0]IIOI01;wire IlOI01;reg [7:0]I1OI01;wire[7:0]IOOl01;wire I0Ol01;reg IIOl01;wire IlOl01,I1Ol01;reg [
23:0]IOO101;wire[23:0]I0O101;wire IIO101;reg IlO101;wire I1O101,IOOOI1;reg I0OOI1;wire IIOOI1,IlOOI1;reg [7:0]I1OOI1;wire[7:0]IOO0I1;wire I0O0I1;reg [4:0]IIO0I1;wire[4:0]IlO0I1;wire I1O0I1;reg IOOII1;wire I0OII1
,IIOII1;reg IlOII1;wire I1OII1,IOOlI1;reg [27:0]I0OlI1;reg [27:0]IIOlI1;wire IlOlI1;wire I1OlI1,IOO1I1,I0O1I1,IIO1I1,IlO1I1,I1O1I1,IOOOl1,I0OOl1,IIOOl1,IlOOl1,I1OOl1,IOO0l1,I0O0l1,IIO0l1,IlO0l1,I1O0l1,IOOIl1
,I0OIl1,IIOIl1,IlOIl1,I1OIl1,IOOll1,I0Oll1,IIOll1;wire[27:0]IlOll1,I1Oll1,IOO1l1;wire[23:0]I0O1l1,IIO1l1,IlO1l1,I1O1l1;wire[9:0]IOOO11,I0OO11,IIOO11,IlOO11;wire I1OO11,IOO011,I0O011,IIO011,IlO011,I1O011
,IOOI11,I0OI11,IIOI11,IlOI11,I1OI11,IOOl11;wire[95:0]I0Ol11;wire[31:0]IIOl11,IlOl11,I1Ol11,IOO111,I0O111,IIO111,IlO111,I1O111,IO0OO1,I00OO1,II0OO1,Il0OO1,I10OO1,IO00O1,I000O1,II00O1,Il00O1,I100O1,IO0IO1
,I00IO1,II0IO1,Il0IO1,I10IO1,IO0lO1,I00lO1,II0lO1,Il0lO1,I10lO1,IO01O1,I001O1,II01O1,Il01O1,I101O1,IO0O01,I00O01,II0O01,Il0O01,I10O01,IO0001,I00001,II0001;wire[27:0]Il0001,I10001,IO0I01,I00I01,II0I01;
wire[9:0]Il0I01,I10I01,IO0l01;wire[4:0]I00l01,II0l01,Il0l01;wire I10l01,IO0101,I00101,II0101,Il0101,I10101,IO0OI1,I00OI1,II0OI1,Il0OI1,I10OI1,IO00I1,I000I1,II00I1,Il00I1,I100I1,IO0II1,I00II1,II0II1,Il0II1
,I10II1,IO0lI1,I00lI1,II0lI1,Il0lI1,I10lI1,IO01I1,I001I1,II01I1,Il01I1,I101I1,IO0Ol1,I00Ol1,II0Ol1,Il0Ol1,I10Ol1,IO00l1,I000l1,II00l1,Il00l1,I100l1,IO0Il1,I00Il1,II0Il1,Il0Il1,I10Il1,IO0ll1,I00ll1,II0ll1
,Il0ll1,I10ll1,IO01l1,I001l1,II01l1,Il01l1,I101l1,IO0O11,I00O11,II0O11,Il0O11,I10O11,IO0011,I00011,II0011,Il0011,I10011,IO0I11,I00I11,II0I11,Il0I11,I10I11,IO0l11,I00l11,II0l11,Il0l11,I10l11,IO0111,I00111
,II0111,Il0111,I10111,IOIOO1,I0IOO1,IIIOO1;assign I1OOl1=1'd1;assign I0Oll1=loadArgs;assign status={IOO001,IOOlO1,I0O0O1};assign busy=IlOOO1;assign product={IOOII1,I1O0O1[7:0],I0OlI1[25:3]};assign IOO0l1
=1'd1;assign IIOll1=1'd1;assign IIO1I1=I1OOI1[0];assign I1O0l1=IIO1I1;assign IlO1I1=I1OOI1[1];assign IOOIl1=IlO1I1;assign IIOOl1=I1OOI1[2];assign I1OIl1=IIOOl1;assign I1OlI1=I1OOI1[3];assign I0O0l1=I1OlI1
;assign IlOOl1=I1OOI1[4];assign IOOll1=IlOOl1;assign I1O1I1=I1OOI1[5];assign I0OIl1=I1O1I1;assign IOOOl1=I1OOI1[6];assign IIOIl1=IOOOl1;assign I0O1I1=I1OOI1[7];assign IlO0l1=I0O1I1;assign I0OOl1=1'd1;
assign IlOIl1=1'd1;assign IOO1I1=loadArgs&& !IlOOO1;assign IIO0l1=IOO1I1;assign I1OO11=I1OOI1[5]&& I10Il1&& Il0Il1;assign IlO011=I1OOI1[5]&& (I10Il1&& !Il0Il1|| !I10Il1&& II0Il1);assign I1O011=I1OOI1[
6]&& I10l01&& I0OlI1[27:3]== 25'd33554431;assign IOOI11=I1OOI1[5]&& !I10Il1&& !II0Il1;assign IIOI11=I1OOI1[2]&& !I1O1O1;assign IlOI11=I1OOI1[2]&& I1O1O1&& !IIOl01;assign I1OI11=I1OOI1[7]&& (IOO001|| IOOlO1
|| IOIOO1);assign IOOl11=I1OOI1[6]&& I10l01;assign IOO011=!I10011&& !I00I11&& !II0I11&& Il0011| Il0111;assign I0O011=!I1O1O1|| !IIOl01;assign IIO011=I10Il1&& !Il0Il1;assign IOOO11=I10Il1 ? 10'd896:Il0I01
;assign I0OO11=I1O0O1+10'd1;assign IIOO11=(IOO001|| IOOlO1)? 10'b1111111111:(IOIOO1 ? 10'd0:{I1O0O1[9:8],~I1O0O1[7],I1O0O1[6:0]});assign IlOO11=({I0O1O1[7],I0O1O1[7],I0O1O1}+{I1OI01[7],I1OI01[7],I1OI01
}-{5'b0,IIO0I1})+10'd1;assign I0OI11=!I10011&& !I00I11&& II0I11;assign I0O1l1=IIOO01<< I00l01;assign IIO1l1={I0IOO1,IlOlO1[22:0]};assign IlO1l1=IOO101<< I00l01;assign I1O1l1={IIIOO1,I0OI01[22:0]};assign
IlOll1=I10Il1 ? (I10I01[9]? Il0001:I10001):IO0I01;assign I1Oll1=IOO001 ? II0I01:28'd0;assign IOO1l1=(I0OlI1[27:3]== 25'd33554431)? 28'd0:I00I01;assign I0OOO1=I1OO11|| IOO011;assign IIOOO1=I1OOI1[5]&& I10Il1
&& Il0Il1|| I1OOI1[0];assign I1OOO1=IIO0l1;assign IOO0O1=I1OOI1[7]|| IIO0l1;assign IIO0O1=I1OOI1[2]? I0O011:IIO011;assign IlO0O1=I1OOI1[2]|| I1OOI1[5];always @(IlO011 or IOOO11 or I1O011 or I0OO11 or I1OOI1
or IIOO11 or IlOO11)begin case (1'b1)IlO011:IOOIO1=IOOO11;I1O011:IOOIO1=I0OO11;I1OOI1[7]:IOOIO1=IIOO11;I1OOI1[3]:IOOIO1=IlOO11;default :IOOIO1=10'b1010101010;endcase end assign I0OIO1=IlO011|| I1OOI1[6
]&& I10l01&& I0OlI1[27:3]== 25'd33554431|| I1OOI1[7]|| I1OOI1[3];assign IlOIO1=I0Ol11[47:0];assign I1OIO1=I1OlI1;assign I0OlO1=IOOI11|| I0OI11;assign IIOlO1=I1OOI1[5]&& !I10Il1&& !II0Il1|| I1OOI1[0];assign
I1OlO1=leftArg;assign IOO1O1=IOO1I1;assign IIO1O1=I101l1 ? 8'h81:IlOlO1[30:23]-8'd128;assign IlO1O1=IlO1I1;assign IOOO01=I0IOO1;assign I0OO01=IlO1I1;assign IlOO01=IIOI11 ? I0O1l1:IIO1l1;assign I1OO01=I1OOI1
[2]&& !I1O1O1|| I1OOI1[1];assign I0O001=I10011|| I00I11;assign IIO001=IIO1I1;assign I1O001=IIOl11[4:0]-5'd26;assign IOOI01=IlOOl1;assign IIOI01=rightArg;assign IlOI01=IOO1I1;assign IOOl01=I10I11 ? 8'h81
:I0OI01[30:23]-8'd128;assign I0Ol01=IlO1I1;assign IlOl01=IIIOO1;assign I1Ol01=IlO1I1;assign I0O101=IlOI11 ? IlO1l1:I1O1l1;assign IIO101=I1OOI1[2]&& I1O1O1&& !IIOl01|| I1OOI1[1];assign I1O101=1'b0;assign
IOOOI1=1'b0;assign IIOOI1=1'b0;assign IlOOI1=1'b0;assign IOO0I1=I1OOI1[7]? 8'h0:{I1OOI1[6:0],IlOOO1&& I1OOI1== 8'd0};assign I0O0I1=I1OOI1[7]|| IlOOO1&& I1OOI1== 8'd0|| I1OOI1[6:0]!= 7'd0;assign IlO0I1
=I00l01;assign I1O0I1=IIOOl1;assign I0OII1=IlOlO1[31]^ I0OI01[31];assign IIOII1=IlO1I1;assign I1OII1=IIOIO1[20:0]!= 21'd0;assign IOOlI1=IlOOl1;always @(IlO011 or IlOll1 or I1OI11 or I1Oll1 or IOOl11 or IOO1l1
or I1OOI1 or IIOIO1)begin case (1'b1)IlO011:IIOlI1=IlOll1;I1OI11:IIOlI1=I1Oll1;IOOl11:IIOlI1=IOO1l1;I1OOI1[4]:IIOlI1=IIOIO1[47:20];default :IIOlI1=28'b1010101010101010101010101010;endcase end assign IlOlI1
=IlO011|| I1OOI1[7]&& (IOO001|| IOOlO1|| IOIOO1)|| I1OOI1[6]&& I10l01|| I1OOI1[4];assign IIOl11=(IIOIO1[20]&& IO0101)? 32'd0:((IIOIO1[21]&& (!IIOIO1[22]|| IO0ll1)&& I00101&& II0101)? 32'd1:IlOl11);assign
IlOl11=(IIOIO1[22]&& I00101&& II0101)? 32'd2:I1Ol11;assign I1Ol11=(IIOIO1[23]&& II0101)? 32'd3:((IIOIO1[24]&& (!IIOIO1[25]|| I00ll1)&& Il0101&& I10101)? 32'd4:IOO111);assign IOO111=(IIOIO1[25]&& Il0101
&& I10101)? 32'd5:I0O111;assign I0O111=(IIOIO1[26]&& I10101)? 32'd6:((IIOIO1[27]&& (!IIOIO1[28]|| II0ll1)&& IO0OI1&& I00OI1)? 32'd7:IIO111);assign IIO111=(IIOIO1[28]&& IO0OI1&& I00OI1)? 32'd8:IlO111;assign
IlO111=(IIOIO1[29]&& I00OI1)? 32'd9:((IIOIO1[30]&& (!IIOIO1[31]|| Il0ll1)&& II0OI1&& Il0OI1)? 32'd10:I1O111);assign I1O111=(IIOIO1[31]&& II0OI1&& Il0OI1)? 32'd11:IO0OO1;assign IO0OO1=(IIOIO1[32]&& Il0OI1
)? 32'd12:((IIOIO1[33]&& (!IIOIO1[34]|| I10ll1)&& I10OI1&& IO00I1)? 32'd13:I00OO1);assign I00OO1=(IIOIO1[34]&& I10OI1&& IO00I1)? 32'd14:II0OO1;assign II0OO1=(IIOIO1[35]&& IO00I1)? 32'd15:((IIOIO1[36]&&
(!IIOIO1[37]|| IO01l1)&& I000I1&& II00I1)? 32'd16:Il0OO1);assign Il0OO1=(IIOIO1[37]&& I000I1&& II00I1)? 32'd17:I10OO1;assign I10OO1=(IIOIO1[38]&& II00I1)? 32'd18:((IIOIO1[39]&& (!IIOIO1[40]|| I001l1)&&
Il00I1&& I100I1)? 32'd19:IO00O1);assign IO00O1=(IIOIO1[40]&& Il00I1&& I100I1)? 32'd20:I000O1;assign I000O1=(IIOIO1[41]&& I100I1)? 32'd21:((IIOIO1[42]&& (!IIOIO1[43]|| II01l1)&& IO0II1)? 32'd22:((IIOIO1
[43]&& IO0II1)? 32'd23:((IIOIO1[44]&& !IIOIO1[45]&& !IIOIO1[46]&& !IIOIO1[47])? 32'd24:((IIOIO1[45]&& !IIOIO1[46]&& !IIOIO1[47])? 32'd25:((IIOIO1[46]&& !IIOIO1[47])? 32'd26:(IIOIO1[47]? 32'd27:32'd0))
))));assign II00O1=I00O11 ? 32'd0:I10IO1;assign Il00O1=(IIOO01[10]&& I00II1&& II0II1)? 32'd10:I100O1;assign I100O1=(IIOO01[11]&& II0II1)? 32'd11:((IIOO01[12]&& (!IIOO01[13]|| Il0O11)&& Il0II1&& I10II1)
? 32'd12:IO0IO1);assign IO0IO1=(IIOO01[13]&& Il0II1&& I10II1)? 32'd13:I00IO1;assign I00IO1=(IIOO01[14]&& I10II1)? 32'd14:((IIOO01[15]&& (!IIOO01[16]|| I10O11)&& IO0lI1&& I00lI1)? 32'd15:II0IO1);assign
II0IO1=(IIOO01[16]&& IO0lI1&& I00lI1)? 32'd16:Il0IO1;assign Il0IO1=(IIOO01[17]&& I00lI1)? 32'd17:((IIOO01[18]&& (!IIOO01[19]|| IO0011)&& II0lI1)? 32'd18:((IIOO01[19]&& II0lI1)? 32'd19:((IIOO01[20]&& !
IIOO01[21]&& !IIOO01[22]&& !IIOO01[23])? 32'd20:((IIOO01[21]&& !IIOO01[22]&& !IIOO01[23])? 32'd21:((IIOO01[22]&& !IIOO01[23])? 32'd22:(IIOO01[23]? 32'd23:32'd0))))));assign I10IO1=(IIOO01[1]&& Il0lI1&&
I10lI1)? 32'd1:IO0lO1;assign IO0lO1=(IIOO01[2]&& I10lI1)? 32'd2:((IIOO01[3]&& (!IIOO01[4]|| I00011)&& IO01I1&& I001I1)? 32'd3:I00lO1);assign I00lO1=(IIOO01[4]&& IO01I1&& I001I1)? 32'd4:II0lO1;assign II0lO1
=(IIOO01[5]&& I001I1)? 32'd5:((IIOO01[6]&& (!IIOO01[7]|| II0011)&& II01I1&& Il01I1)? 32'd6:Il0lO1);assign Il0lO1=(IIOO01[7]&& II01I1&& Il01I1)? 32'd7:I10lO1;assign I10lO1=(IIOO01[8]&& Il01I1)? 32'd8:(
(IIOO01[9]&& (!IIOO01[10]|| II0O11)&& I00II1&& II0II1)? 32'd9:Il00O1);assign IO01O1=I00l11 ? 32'd0:II0O01;assign I001O1=(IOO101[10]&& I101I1&& IO0Ol1)? 32'd10:II01O1;assign II01O1=(IOO101[11]&& IO0Ol1)
? 32'd11:((IOO101[12]&& (!IOO101[13]|| Il0l11)&& I00Ol1&& II0Ol1)? 32'd12:Il01O1);assign Il01O1=(IOO101[13]&& I00Ol1&& II0Ol1)? 32'd13:I101O1;assign I101O1=(IOO101[14]&& II0Ol1)? 32'd14:((IOO101[15]&&
(!IOO101[16]|| I10l11)&& Il0Ol1&& I10Ol1)? 32'd15:IO0O01);assign IO0O01=(IOO101[16]&& Il0Ol1&& I10Ol1)? 32'd16:I00O01;assign I00O01=(IOO101[17]&& I10Ol1)? 32'd17:((IOO101[18]&& (!IOO101[19]|| IO0111)&&
IO00l1)? 32'd18:((IOO101[19]&& IO00l1)? 32'd19:((IOO101[20]&& !IOO101[21]&& !IOO101[22]&& !IOO101[23])? 32'd20:((IOO101[21]&& !IOO101[22]&& !IOO101[23])? 32'd21:((IOO101[22]&& !IOO101[23])? 32'd22:(IOO101
[23]? 32'd23:32'd0))))));assign II0O01=(IOO101[1]&& I000l1&& II00l1)? 32'd1:Il0O01;assign Il0O01=(IOO101[2]&& II00l1)? 32'd2:((IOO101[3]&& (!IOO101[4]|| I00111)&& Il00l1&& I100l1)? 32'd3:I10O01);assign
I10O01=(IOO101[4]&& Il00l1&& I100l1)? 32'd4:IO0001;assign IO0001=(IOO101[5]&& I100l1)? 32'd5:((IOO101[6]&& (!IOO101[7]|| II0111)&& IO0Il1&& I00Il1)? 32'd6:I00001);assign I00001=(IOO101[7]&& IO0Il1&& I00Il1
)? 32'd7:II0001;assign II0001=(IOO101[8]&& I00Il1)? 32'd8:((IOO101[9]&& (!IOO101[10]|| II0l11)&& I101I1&& IO0Ol1)? 32'd9:I001O1);assign I10l01=(I0OlI1[2]&& I0OlI1[1:0]== 2'b0)? I0OlI1[3]|| IlOII1:I0OlI1
[2]&& I0OlI1[1:0]!= 2'b0;assign IO0101=(!IIOIO1[21]|| IIOIO1[22]|| IO0ll1)&& (!IIOIO1[22]|| IO0ll1)&& I00101&& II0101;assign I00101=!IIOIO1[23]|| IIOIO1[24]|| IIOIO1[25]|| I00ll1;assign II0101=(!IIOIO1
[24]|| IIOIO1[25]|| I00ll1)&& (!IIOIO1[25]|| I00ll1)&& Il0101&& I10101;assign Il0101=!IIOIO1[26]|| IIOIO1[27]|| IIOIO1[28]|| II0ll1;assign I10101=(!IIOIO1[27]|| IIOIO1[28]|| II0ll1)&& (!IIOIO1[28]|| II0ll1
)&& IO0OI1&& I00OI1;assign IO0OI1=!IIOIO1[29]|| IIOIO1[30]|| IIOIO1[31]|| Il0ll1;assign I00OI1=(!IIOIO1[30]|| IIOIO1[31]|| Il0ll1)&& (!IIOIO1[31]|| Il0ll1)&& II0OI1&& Il0OI1;assign II0OI1=!IIOIO1[32]||
IIOIO1[33]|| IIOIO1[34]|| I10ll1;assign Il0OI1=(!IIOIO1[33]|| IIOIO1[34]|| I10ll1)&& (!IIOIO1[34]|| I10ll1)&& I10OI1&& IO00I1;assign I10OI1=!IIOIO1[35]|| IIOIO1[36]|| IIOIO1[37]|| IO01l1;assign IO00I1
=(!IIOIO1[36]|| IIOIO1[37]|| IO01l1)&& (!IIOIO1[37]|| IO01l1)&& I000I1&& II00I1;assign I000I1=!IIOIO1[38]|| IIOIO1[39]|| IIOIO1[40]|| I001l1;assign II00I1=(!IIOIO1[39]|| IIOIO1[40]|| I001l1)&& (!IIOIO1
[40]|| I001l1)&& Il00I1&& I100I1;assign Il00I1=!IIOIO1[41]|| IIOIO1[42]|| IIOIO1[43]|| II01l1;assign I100I1=(!IIOIO1[42]|| IIOIO1[43]|| II01l1)&& (!IIOIO1[43]|| II01l1)&& IO0II1;assign IO0II1=(!IIOIO1
[44]|| IIOIO1[45]|| IIOIO1[46]|| IIOIO1[47])&& !IIOIO1[45]&& !IIOIO1[46]&& !IIOIO1[47];assign I00II1=!IIOO01[11]|| IIOO01[12]|| IIOO01[13]|| Il0O11;assign II0II1=(!IIOO01[12]|| IIOO01[13]|| Il0O11)&& (
!IIOO01[13]|| Il0O11)&& Il0II1&& I10II1;assign Il0II1=!IIOO01[14]|| IIOO01[15]|| IIOO01[16]|| I10O11;assign I10II1=(!IIOO01[15]|| IIOO01[16]|| I10O11)&& (!IIOO01[16]|| I10O11)&& IO0lI1&& I00lI1;assign
IO0lI1=!IIOO01[17]|| IIOO01[18]|| IIOO01[19]|| IO0011;assign I00lI1=(!IIOO01[18]|| IIOO01[19]|| IO0011)&& (!IIOO01[19]|| IO0011)&& II0lI1;assign II0lI1=(!IIOO01[20]|| IIOO01[21]|| IIOO01[22]|| IIOO01[
23])&& !IIOO01[21]&& !IIOO01[22]&& !IIOO01[23];assign Il0lI1=!IIOO01[2]|| IIOO01[3]|| IIOO01[4]|| I00011;assign I10lI1=(!IIOO01[3]|| IIOO01[4]|| I00011)&& (!IIOO01[4]|| I00011)&& IO01I1&& I001I1;assign
IO01I1=!IIOO01[5]|| IIOO01[6]|| IIOO01[7]|| II0011;assign I001I1=(!IIOO01[6]|| IIOO01[7]|| II0011)&& (!IIOO01[7]|| II0011)&& II01I1&& Il01I1;assign II01I1=!IIOO01[8]|| IIOO01[9]|| IIOO01[10]|| II0O11;
assign Il01I1=(!IIOO01[9]|| IIOO01[10]|| II0O11)&& (!IIOO01[10]|| II0O11)&& I00II1&& II0II1;assign I101I1=!IOO101[11]|| IOO101[12]|| IOO101[13]|| Il0l11;assign IO0Ol1=(!IOO101[12]|| IOO101[13]|| Il0l11
)&& (!IOO101[13]|| Il0l11)&& I00Ol1&& II0Ol1;assign I00Ol1=!IOO101[14]|| IOO101[15]|| IOO101[16]|| I10l11;assign II0Ol1=(!IOO101[15]|| IOO101[16]|| I10l11)&& (!IOO101[16]|| I10l11)&& Il0Ol1&& I10Ol1;assign
Il0Ol1=!IOO101[17]|| IOO101[18]|| IOO101[19]|| IO0111;assign I10Ol1=(!IOO101[18]|| IOO101[19]|| IO0111)&& (!IOO101[19]|| IO0111)&& IO00l1;assign IO00l1=(!IOO101[20]|| IOO101[21]|| IOO101[22]|| IOO101[
23])&& !IOO101[21]&& !IOO101[22]&& !IOO101[23];assign I000l1=!IOO101[2]|| IOO101[3]|| IOO101[4]|| I00111;assign II00l1=(!IOO101[3]|| IOO101[4]|| I00111)&& (!IOO101[4]|| I00111)&& Il00l1&& I100l1;assign
Il00l1=!IOO101[5]|| IOO101[6]|| IOO101[7]|| II0111;assign I100l1=(!IOO101[6]|| IOO101[7]|| II0111)&& (!IOO101[7]|| II0111)&& IO0Il1&& I00Il1;assign IO0Il1=!IOO101[8]|| IOO101[9]|| IOO101[10]|| II0l11;
assign I00Il1=(!IOO101[9]|| IOO101[10]|| II0l11)&& (!IOO101[10]|| II0l11)&& I101I1&& IO0Ol1;assign I0Ol11={24'b0,IIOO01}*{24'b0,IOO101};assign I00l01=I1O1O1 ? (IIOl01 ? 5'b0:Il0l01):II0l01;assign II0Il1
=(Il0I01^ 10'h200)<= 10'd638;assign Il0Il1=(Il0I01^ 10'h200)<10'd361;assign I10Il1=(Il0I01^ 10'h200)<= 10'd384;assign Il0I01=I1O0O1+{5'd0,IlO001};assign I10I01=I1O0O1+10'd127;assign IO0ll1=IIOIO1[23]||
IIOIO1[24]|| IIOIO1[25]|| I00ll1;assign I00ll1=IIOIO1[26]|| IIOIO1[27]|| IIOIO1[28]|| II0ll1;assign II0ll1=IIOIO1[29]|| IIOIO1[30]|| IIOIO1[31]|| Il0ll1;assign Il0ll1=IIOIO1[32]|| IIOIO1[33]|| IIOIO1[
34]|| I10ll1;assign I10ll1=IIOIO1[35]|| IIOIO1[36]|| IIOIO1[37]|| IO01l1;assign IO01l1=IIOIO1[38]|| IIOIO1[39]|| IIOIO1[40]|| I001l1;assign I001l1=IIOIO1[41]|| IIOIO1[42]|| IIOIO1[43]|| II01l1;assign II01l1
=IIOIO1[44]|| IIOIO1[45]|| IIOIO1[46]|| IIOIO1[47];assign Il01l1=IlOlO1[30:23]== 8'hff;assign I101l1=IlOlO1[30:23]== 8'h0;assign IO0O11=IlOlO1[22:0]== 23'b0;assign I00O11=IIOO01[0]&& (!IIOO01[1]|| IIOO01
[2]|| IIOO01[3]|| IIOO01[4]|| I00011)&& Il0lI1&& I10lI1;assign II0O11=IIOO01[11]|| IIOO01[12]|| IIOO01[13]|| Il0O11;assign Il0O11=IIOO01[14]|| IIOO01[15]|| IIOO01[16]|| I10O11;assign I10O11=IIOO01[17]
|| IIOO01[18]|| IIOO01[19]|| IO0011;assign IO0011=IIOO01[20]|| IIOO01[21]|| IIOO01[22]|| IIOO01[23];assign I00011=IIOO01[5]|| IIOO01[6]|| IIOO01[7]|| II0011;assign II0011=IIOO01[8]|| IIOO01[9]|| IIOO01
[10]|| II0O11;assign Il0011=I101l1& IO0O11;assign I10011=Il01l1& ~IO0O11| Il0I11& ~IO0l11;assign IO0I11=Il01l1& IO0O11;assign I00I11=IO0I11& Il0111| Il0011& I10111;assign II0I11=IO0I11| I10111;assign Il0I11
=I0OI01[30:23]== 8'hff;assign I10I11=I0OI01[30:23]== 8'h0;assign IO0l11=I0OI01[22:0]== 23'b0;assign I00l11=IOO101[0]&& (!IOO101[1]|| IOO101[2]|| IOO101[3]|| IOO101[4]|| I00111)&& I000l1&& II00l1;assign
II0l11=IOO101[11]|| IOO101[12]|| IOO101[13]|| Il0l11;assign Il0l11=IOO101[14]|| IOO101[15]|| IOO101[16]|| I10l11;assign I10l11=IOO101[17]|| IOO101[18]|| IOO101[19]|| IO0111;assign IO0111=IOO101[20]|| IOO101
[21]|| IOO101[22]|| IOO101[23];assign I00111=IOO101[5]|| IOO101[6]|| IOO101[7]|| II0111;assign II0111=IOO101[8]|| IOO101[9]|| IOO101[10]|| II0l11;assign Il0111=I10I11& IO0l11;assign I10111=Il0I11& IO0l11
;assign II0l01=5'd23-II00O1[4:0];assign Il0l01=5'd23-IO01O1[4:0];assign IOIOO1=I0OlI1== 28'd0|| !I1O1O1&& !IIOl01|| IOOOO1;assign Il0001=I0OlI1>> IO0l01;assign IO0l01=I10I01[9]? -I10I01:I10I01;assign I10001
=I0OlI1<< IO0l01;assign IO0I01=I0OlI1>> IlO001;assign I00I01={I0OlI1[27:3]+25'd1,I0OlI1[2:0]};assign II0I01={I0OlI1[27:26],1'b1,I0OlI1[24:0]};assign I0IOO1=~I101l1;assign IIIOO1=~I10I11;always @(posedge
CLK)begin if(!nRST)begin IOOOO1<= 1'b0;IlOOO1<= 1'b0;I0O0O1<= 1'd0;I1O0O1<= 10'h0;IIOIO1<= 48'h0;IOOlO1<= 1'b0;IlOlO1<= 32'd0;I0O1O1<= 8'h0;I1O1O1<= 1'd0;IIOO01<= 24'h0;IOO001<= 1'b0;IlO001<= 5'h0;I0OI01
<= 32'd0;I1OI01<= 8'h0;IIOl01<= 1'd0;IOO101<= 24'h0;IlO101<= 1'd0;I0OOI1<= 1'd0;I1OOI1<= 8'd0;IIO0I1<= 5'h0;IOOII1<= 1'd0;IlOII1<= 1'd0;I0OlI1<= 28'h0;end else begin if(IIOOO1)IOOOO1<= I0OOO1;if(IOO0O1
)IlOOO1<= I1OOO1;if(IlO0O1)I0O0O1<= IIO0O1;if(I0OIO1)I1O0O1<= IOOIO1;if(I1OIO1)IIOIO1<= IlOIO1;if(IIOlO1)IOOlO1<= I0OlO1;if(IOO1O1)IlOlO1<= I1OlO1;if(IlO1O1)I0O1O1<= IIO1O1;if(I0OO01)I1O1O1<= IOOO01;if
(I1OO01)IIOO01<= IlOO01;if(IIO001)IOO001<= I0O001;if(IOOI01)IlO001<= I1O001;if(IlOI01)I0OI01<= IIOI01;if(I0Ol01)I1OI01<= IOOl01;if(I1Ol01)IIOl01<= IlOl01;if(IIO101)IOO101<= I0O101;if(IOOOI1)IlO101<= I1O101
;if(IlOOI1)I0OOI1<= IIOOI1;if(I0O0I1)I1OOI1<= IOO0I1;if(I1O0I1)IIO0I1<= IlO0I1;if(IIOII1)IOOII1<= I0OII1;if(IOOlI1)IlOII1<= I1OII1;if(IlOlI1)I0OlI1<= IIOlI1;end end endmodule
