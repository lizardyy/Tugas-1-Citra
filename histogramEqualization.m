function result = histogramEqualization(imagedata)
    [N, M] = size(imagedata);
            
    % Hitung histogram citra
    HistInput = myhist(imagedata, true);
    HistOutput = zeros(256, 1);

    result = imagedata;

    % Hitung histogram citra
    sum = 0.0;
    for i = 1:256
        sum = sum + HistInput(i);
        HistOutput(i) = floor(255 * sum);
    end

    % Update citra sesuai histogram hasil perataan
    for i = 1:N
        for j = 1:M
            result(i,j) = HistOutput(imagedata(i, j) + 1);
        end
    end

end