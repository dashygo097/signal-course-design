clear;
clc;

for i = 1:9
    % 构建文件路径
    filename = fullfile('../data/original_data', sprintf('%d.mat', i));
    
    % 加载 .mat 文件
    data = load(filename);
    
    % 获取文件中的变量名，假设文件中只有一个变量
    varName = fieldnames(data);
    
    % 将数据赋值给对应的变量名
    assignin('base', sprintf('noise%d', i), data.(varName{1}));
end

noise=[noise1,noise2,noise3,noise4,noise5,noise6,noise7,noise8,noise9];
a = array2timetable(noise,"SampleRate",40000000);
stackedplot(a);
figure;
pspectrum(a);
legend("AutoUpdate","on");

band5 = bandpass(a(:,"noise5"),[4280000,4320000]);
band6 = bandpass(a(:,"noise6"),[7340000,7440000]);
band81 = bandpass(a(:,"noise8"),[2870000,2930000]);
band82 = bandpass(a(:,"noise8"),[4960000,5040000]);
band83 = bandpass(a(:,"noise8"),[12370000,12430000]);
band9 = bandpass(a(:,"noise9"),[1260000,1340000]);
t = timetable(a.Time,band5.noise5,band6.noise6,band81.noise8,band82.noise8,band83.noise8,band9.noise9,'VariableNames',["5","6","8_1","8_2","8_3","9"]);
figure;
stackedplot(t);
figure;
pspectrum(a.noise5,a.Time,"spectrogram","FrequencyLimits",[4280000,4320000],"MinThreshold",6);
figure;
pspectrum(a.noise6,a.Time,"spectrogram","FrequencyLimits",[7340000,7440000],"MinThreshold",5.7);
figure;
pspectrum(a.noise8,a.Time,"spectrogram","FrequencyLimits",[2870000,2930000],"MinThreshold",6.16);
figure;
pspectrum(a.noise8,a.Time,"spectrogram","FrequencyLimits",[4960000,5040000],"MinThreshold",6);
figure;
pspectrum(a.noise8,a.Time,"spectrogram","FrequencyLimits",[12370000,12430000],"MinThreshold",5.9);
figure;
pspectrum(a.noise9,a.Time,"spectrogram","FrequencyLimits",[1260000,1340000],"MinThreshold",6);

%计算信噪比
snr5=10*log10(sum(band5.noise5.^2)/sum((noise5-band5.noise5).^2));
snr6=10*log10(sum(band6.noise6.^2)/sum((noise6-band6.noise6).^2));
snr8=10*log10(sum((band81.noise8+band82.noise8+band83.noise8).^2)/sum((band81.noise8+band82.noise8+band83.noise8-noise8).^2));
snr9=10*log10(sum(band9.noise9.^2)/sum((noise9-band9.noise9).^2));
%根据功率谱图和频谱图大致推测淹没功率
figure;
pspectrum(a.noise9,a.Time);
figure;
pspectrum(a.noise9,a.Time,"spectrogram");
