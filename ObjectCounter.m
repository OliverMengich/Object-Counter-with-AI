queryImage = imread('unnamed','jpg'); queryImage = rgb2gray(queryImage);
Image = imtophat(queryImage,strel('cuboid',[20,18,10]));%strel('disk',12,10));
Image = imopen(Image,strel('octagon',6)); %strel('diamond',10)); %strel('rect',[20,9]));


threshold =  multithresh(Image);
BW = Image > threshold;

blob = vision.BlobAnalysis('AreaOutputPort',false,'BoundingBoxOutputPort',false,'OutputDataType','double');
Centroids = step(blob,BW);
OrangeCount = int32(size(Centroids,1));
displaytext = sprintf('Number of Items are %d', OrangeCount);
It = insertText(queryImage,[10 280],displaytext,'FontSize',10);

It = insertMarker(It, Centroids, '+', 'Size', 5, 'Color', 'green');
imshow(It)