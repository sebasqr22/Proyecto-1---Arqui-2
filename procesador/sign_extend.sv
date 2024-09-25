module sign_extend (In,ImmSrc,Imm_Ext);
    input [31:0] In;
    input [1:0] ImmSrc;
    output [31:0] Imm_Ext;

	 // {20{In[31]}} no se como extender los bits restantes 
    assign Imm_Ext =  (ImmSrc == 2'b01) ? {{20{In[31]}},In[31:26],In[22:17]} :
							 (ImmSrc == 2'b10) ? {{20{In[31]}},In[31:26],In[10:5]} : 32'h00000000; 
endmodule