function result = contrastStretching(numChannels, Inputimagedata)
    if numChannels == 1
        rmin = min(min(Inputimagedata));
        rmax = max(max(Inputimagedata));
        result = (Inputimagedata - rmin) .* (255/ (rmax - rmin));
    elseif numChannels == 3
        rmin = [0, 0, 0];
        rmax = [0, 0, 0];
        for i = 1:numChannels
            rmin(i) = min(min(Inputimagedata(:,:,i)));
            rmax(i) = max(max(Inputimagedata(:,:,i)));
        end
        rmin = max(rmin);
        rmax = min(rmax);
        result = (Inputimagedata - rmin) .* (255/ (rmax - rmin));
    else
        msgbox('Unsupported image format', 'Error', 'error');
    end
end