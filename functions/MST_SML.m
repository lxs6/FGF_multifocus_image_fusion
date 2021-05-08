function final_matrix=MST_SML(A,d1,d2,d3)

[h,w]=size(A);
A1=double(A);

matrix_en1=ReflectEdge(A1,1); 
for i=2:h+1
    for j=2:w+1
        I1(i-1,j-1)=abs(2*matrix_en1(i,j)-matrix_en1(i-1,j)-matrix_en1(i+1,j))+abs(2*matrix_en1(i,j)-matrix_en1(i,j-1)-matrix_en1(i,j+1))+abs(2*matrix_en1(i,j)-matrix_en1(i-1,j-1)-matrix_en1(i+1,j+1))+abs(2*matrix_en1(i,j)-matrix_en1(i+1,j-1)-matrix_en1(i-1,j+1));
    end
end
        
I11=ReflectEdge(I1,d1);  
I12=ReflectEdge(I1,d2);   
I13=ReflectEdge(I1,d3);  

for i=1:h
    for j=1:w
       window1= I11(i:i+2*d1,j:j+2*d1);  
       window3= I12(i:i+2*d2,j:j+2*d2); 
       window5= I13(i:i+2*d3,j:j+2*d3);  

       win1=(window1).^2;   
       win3=(window3).^2;
       win5=(window5).^2;
       
       SF1(i,j)=(sum(win1(:)));  
       SF3(i,j)=(sum(win3(:)));
       SF5(i,j)=(sum(win5(:)));
       
       MSF1(i,j)=abs(SF1(i,j)-SF3(i,j))+abs(SF1(i,j)-SF5(i,j)); 
    end
end  
final_matrix = MSF1;