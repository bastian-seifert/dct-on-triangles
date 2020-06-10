%choose size of image, be aware we create the whole DCT matrix, so it gets
%quite large fast!
szN = 100;
%create triangle DCT
dtt = createTriangleDCT(szN);
%read an example image
J = imresize(imread('rice.png'), [szN szN]);
%take one triangle of it
idx = tril(ones(szN,szN))==1;
%triangle DCT transform
triangleTransformedPart = dtt * double(J(idx));
%throw away three quarter of the frequencies
triangleTransformedPart(szN/2*szN/2:end) = 0;
%transform to space domain again
J(idx) = uint8(dtt\triangleTransformedPart);
firstJ = J;

%throw away 15/16 of the frequencies
triangleTransformedPart(szN/4*szN/4:end) = 0;
%transform to space domain again
J(idx) = uint8(dtt\triangleTransformedPart);
%compare the filtered with the non-filtered part
% figure;
% montage([firstJ, J]);

dot = createOrthoTriangleDCT(szN);
%read an example image
orthoJ = imresize(imread('rice.png'), [szN szN]);
%take one triangle of it
idx = tril(ones(szN,szN))==1;
%triangle DCT transform
triangleTransformedPart = dot * double(orthoJ(idx));
%throw away three quarter of the frequencies
triangleTransformedPart(szN/2*szN/2:end) = 0;
%transform to space domain again
orthoJ(idx) = uint8(dot' * triangleTransformedPart);
secondJ = orthoJ;

%throw away 15/16 of the frequencies
triangleTransformedPart(szN/4*szN/4:end) = 0;
%transform to space domain again
orthoJ(idx) = uint8(dot' * triangleTransformedPart);
%compare the filtered with the non-filtered part
figure;
montage([firstJ, J;secondJ, orthoJ]);
