function result = histogramSpecification(Inputimagedata, SpecTargetImagedata)
    inputHist = myhist(Inputimagedata, true);
    targetHist = myhist(SpecTargetImagedata, true);
    
    % Calculate input equalization
    inputEq = inputHist;
    sum = 0.0;
    for i = 1:256
        sum = sum + inputHist(i);
        inputEq(i) = floor(255 * sum);
    end

    % Calculate target equalization
    targetEq = targetHist;
    sum = 0.0;
    for i = 1:256
        sum = sum + targetHist(i);
        targetEq(i) = floor(255 * sum);
    end

    % Do inverse transformation
    invMapping = zeros(256);
    for i = 1:256
        minval = abs(inputEq(i) - targetEq(1));
        minj = 0;
        for j = 1:256
            if (abs(inputEq(i) - targetEq(j)) < minval)
                minval = abs(inputEq(i) - targetEq(j));
                minj = j;
            end
        end
        invMapping(i) = minj;
    end

    % Apply the inverse to input image, resulting output image
    result = Inputimagedata;
    [M, N] = size(Inputimagedata);
    for i = 1:M
        for j = 1:N
            result(i,j) = invMapping(Inputimagedata(i,j) + 1);
        end
    end
end