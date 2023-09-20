function result = imageBrightening(a, b, r)

    % Doing calculation
    s = a * r + b;

    % Replace values > 255 to 255 and values < 0 to 0
    s(s > 255) = 255;
    s(s < 0) = 0;

    % Set output image
    result = s;
end