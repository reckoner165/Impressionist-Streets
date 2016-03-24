xCor = [120:1:135];
yCor = [-25:1:-15];
brushsize = input('Enter Brush Size (from 20 to 100): ');
for k = 1:length(xCor)
    for j = 1:length(yCor)
        [X,camp] = get_google_streetview([xCor(k) yCor(j)]);
%         X(:,:,1) = uint8(double(X(:,:,1))*(x(k)-100)/50);
%         X(:,:,2) = uint8(double(X(:,:,2))*(x(k)+y(j)-100)/10);
%         X(:,:,3) = uint8(double(X(:,:,3))*-y(j)/50);
        dim = size(X);
        for x = 1:brushsize:ceil(dim(1)-brushsize)
            for y = 1:(2*brushsize):ceil(dim(2)-(2*brushsize))
                out1(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:) = sort(X(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:),1);
                out2(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:) = sort(X(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:),1,'descend');
        %           out3(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:) = sort(in(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:),3,'ascend');
            
            end
        end
        out = out1/2+out2/3;
        drawnow;
        h = imshow(out)
%         pause(0.0001);
        clear h;
    end
end