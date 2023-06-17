%% Preaparation
clear
clc

%% Data 
training = readmatrix("data\training.csv"); 
Ptg = training(:,1:8)';
Ttg = training(:,9);

testing = readmatrix("data\testing.csv");
Ptt = testing(:,1:8)';
Ttt = testing(:,9);

%% Training
S1 = 8;
S2 = 8;
S3 = 1;

W1 = rand(S1,8);
b1 = rand(S1,1);

W2 = rand(S2,S1);
b2 = rand(S2,1);

W3 = rand(S3,S2);
b3 = rand(S3,1);

alpha = 0.01;
epochs = 5000;

for i = 1:epochs
    for j = 1:length(Ptg)
        a1 = logsig(W1 * Ptg(:, j) + b1);
        a2 = logsig(W2 * a1 + b2);
        a3 = purelin(W3 * a2 + b3);
        e = Ttg(j) - a3;
        
        se3 = -2 * e;
        se2 = (1 - a2) .* a2 .* (W3' * se3);
        se1 = (1 - a1) .* a1 .* (W2' * se2);
        
        W3 = W3 - alpha * se3 * a2';
        b3 = b3 - alpha * se3;
        W2 = W2 - alpha * se2 * a1';
        b2 = b2 - alpha * se2;
        W1 = W1 - alpha * se1 * Ptg(:, j)';
        b1 = b1 - alpha * se1;
    end
end

%Testing with training Data
T_predicted = zeros(length(Ptg),1);
for i = 1:length(Ptg)
    a1 = logsig(W1 * Ptg(:, i) + b1);
    a2 = logsig(W2 * a1 + b2);
    a3 = purelin(W3 * a2 + b3);
    % disp(a3);
    if a3 >= 0
        T_predicted(i) = 1;
    else
        T_predicted(i) = -1;
    end
end

correlationMatrix = corrcoef(training);

% disp('Correlation Matrix training data:');
% disp(correlationMatrix);
% 
C = confusionmat(Ttg, T_predicted);
% disp('Confusion Matrix training data:');
% disp(C);
accuracy = sum(diag(C)) / sum(C(:));
disp('Accuracy training data:');
disp(accuracy);

%% Testing
T_predicted = zeros(length(Ptt),1);
for i = 1:length(Ptt)
    a1 = logsig(W1 * Ptt(:, i) + b1);
    a2 = logsig(W2 * a1 + b2);
    a3 = purelin(W3 * a2 + b3);
    
    if a3 >= 0
        T_predicted(i) = 1;
    else
        T_predicted(i) = -1;
    end
end

correlationMatrix = corrcoef(testing);

disp('Correlation Matrix testing data:');
% disp(correlationMatrix);

C = confusionmat(Ttt, T_predicted);
% disp('Confusion Matrix testing data:');
% disp(C);

accuracy = sum(diag(C)) / sum(C(:));
disp('Accuracy testing data:');
disp(accuracy);
