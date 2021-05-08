function F=ICIVC_fusion(ima1,ima2)

%% generate the operator of neighbour distance filter
radia = 2;sigma1 = 0.4;
[adnd,hdnd,vdnd,t45dnd,t135dnd] = filter_LMN(radia,0,0,sigma1);

M1 = im2double(ima1);  
M2 = im2double(ima2);
[r,s,z]=size(M1); [r,s,z]=size(M2);

%% ND filter
f2=fexp(adnd,1);                                  
M1_highpass = imfilter(M1,f2,'replicate');              
M2_highpass = imfilter(M2,f2,'replicate');       
M1_lowpass=M1-M1_highpass;                                    
M2_lowpass=M2-M2_highpass;                        
                                                       
%% NSML  
SF11=zeros(size(M1));
SF22=zeros(size(M1));
d1=3; d2=5; d3=7;                    
SF11 = MST_SML(M1,d1,d2,d3);
SF22 = MST_SML(M2,d1,d2,d3);    
temp1 = SF11<SF22; 
map1= ones(r,s);
map1(temp1) = 0; 
map2 = imcomplement(map1); 

%% BCV
N=8;           % parameter
map5 = Feng_Major_filt1(map1,N);    
map6 = Feng_Major_filt1(map2,N);
map5 = double(map5); map6 = double(map6);
%% bwareaopen 
area=12000;     % parameter
map7 = bwareaopen(map5,area);    
map8 = imcomplement(map7);     
map7 = double(map7);  map8 = double(map8);

%% FGF
% parameters
 rr1=25; rr2=10;           
 ss=5;                    
 eps1=0.3;                 % eps is a regularization parameter controlling the degree of smoothness
 eps2=0.000001;    
   if size(M1,3)==1        % for gray images
      WL1 = fastguidedfilter(M1,map7,rr1,eps1,ss);             
      WL2 = fastguidedfilter(M2,map8,rr1,eps1,ss);
      WH1 = fastguidedfilter(M1,map7,rr2,eps2,ss);            
      WH2 = fastguidedfilter(M2,map8,rr2,eps2,ss);
   else                    % for color images
     WL1 = fastguidedfilter_color(M1,map7,rr1,eps1,ss);        
     WL2 = fastguidedfilter_color(M2,map8,rr1,eps1,ss);
     WH1 = fastguidedfilter_color(M1,map7,rr2,eps2,ss);       
     WH2 = fastguidedfilter_color(M2,map8,rr2,eps2,ss);
   end   
%% Fused result
 LL = WL1./(WL1+WL2).*M1_lowpass+WL2./(WL1+WL2).*M2_lowpass;        % WH1£¬WH2£¬WL1£¬WL2 are weight coefficients
 HH = WH1./(WH1+WH2).*M1_highpass+WH2./(WH1+WH2).*M2_highpass;
 F = LL + HH;   % fused result
