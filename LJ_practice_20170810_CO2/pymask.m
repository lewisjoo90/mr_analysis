%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is to be called from python, using the matlab engine. It
% may then be used to create ROI masks. To call from python, use the    
% following:                                                            
    % >>import matlab.engine
    % >>eng = matlab.engine.start_matlab()
    % >>eng.pymask('Image.hdr',slice,'SaveAs.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [mask] = pymask(file_in, sl, file_out, type)
% file_in = directory and filename of images to be masked
% slice = slice number to open 
% file_out = name of file to save masks as

if strcmp(type,'analyze')
    im = analyze75read(file_in); 
    figure;
    imagesc(im(:,:,sl));
    mask = roipoly;
elseif strcmp(type,'nii')
    im = load_nii(file_in);
    im = im.img;
    figure;
    imagesc(transpose(im(:,:)));
    mask = roipoly;
end


save(file_out, ['mask']);
close;
end