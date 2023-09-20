function result = contrastStretching(numChannels, Inputimagedata)
    % Check number of channels
    if numChannels == 1
        % Find minimum and maximum value
        rmin = min(min(Inputimagedata));
        rmax = max(max(Inputimagedata));

        % Do calculation and set result
        result = (Inputimagedata - rmin) .* (255/ (rmax - rmin));
    elseif numChannels == 3
        % Find minimum and maximum value for each channel
        rmin = [0, 0, 0];
        rmax = [0, 0, 0];
        for i = 1:numChannels
            rmin(i) = min(min(Inputimagedata(:,:,i)));
            rmax(i) = max(max(Inputimagedata(:,:,i)));
        end
        rmin = max(rmin);
        rmax = min(rmax);

        % Do calculation and set result
        result = (Inputimagedata - rmin) .* (255/ (rmax - rmin));
    else
        msgbox('Unsupported image format', 'Error', 'error');
    end
end