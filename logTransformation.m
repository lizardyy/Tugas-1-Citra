function result = logTransformation(c,Inputimagedata)
    r = im2double(Inputimagedata);  % convert image data to double

    % Doing calculation
    s = c * log(1 + r);

    % Replace values > 1 to 1 and values < 0 to 0
    s(s > 1) = 1;
    s(s < 0) = 0;
    
    % Set output image (and map resulting data to uint8)
    result = im2uint8(s);
end