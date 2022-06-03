[segments, fs] = detectVoiced('pocket sounds.wav');
for i = 1 : length(segments)
    y = cell2mat(segments(i));
    audiowrite(sprintf('rustle_%d.wav',i), y,fs);
end