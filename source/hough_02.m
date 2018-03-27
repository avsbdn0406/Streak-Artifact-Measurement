img = imread('E:\Eun\StreakArtifact\result\ellipse_line.png');
gray=rgb2gray(img);   
BW = edge(gray,'canny');                          

[H,theta,rho] = hough(BW);                                                       
figure, imshow(imadjust(mat2gray(H)),[],'XData',theta,'YData',rho,...
        'InitialMagnification','fit');
xlabel('\theta (degrees)'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(hot);


P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','black');

