% Generate histogram for image data, 0-255 are mapped to index 1-256.
function result = myhist(imagedata, normalized)
    % Hitung histogram citra
    result = zeros(256, 1);
    
    [M, N] = size(imagedata);
    for i = 1:M
        for j = 1:N
            intensity = imagedata(i, j) + 1; % +1 untuk mengatasi nilai intensitas dari 0 hingga 255
            result(intensity) = result(intensity) + 1;
        end
    end

    if normalized
        result = result / (M * N);
    end
end
