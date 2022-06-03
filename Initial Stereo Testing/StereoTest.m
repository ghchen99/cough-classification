filename = "Recordings/phase 11.wav";
[y,Fs] = audioread(filename);
window = hamming(512); %%window with size of 512 points
noverlap = 256; %%the number of points for repeating the window
nfft = 1024; %%size of the fit
left = y(:,1);
right = y(:,2);
[S,F,T,P] = spectrogram(left,window,noverlap,nfft,Fs,'yaxis');
figure();
surf(T,F,10*log10(P),'edgecolor','none'); axis tight;view(0,90);
colormap(hot); %%for the indexed colors, check this in help for blck/white
set(gca,'clim',[-80 -30]); %%clim is the limits of the axis colours
xlabel('Time s');
ylabel('Frequency kHz')
[S,F,T,P] = spectrogram(right,window,noverlap,nfft,Fs,'yaxis');
figure();
surf(T,F,10*log10(P),'edgecolor','none'); axis tight;view(0,90);
colormap(hot); %%for the indexed colors, check this in help for blck/white
set(gca,'clim',[-80 -30]); %%clim is the limits of the axis colours
xlabel('Time s');
ylabel('Frequency kHz')
figure();
plot(left);
hold on;
plot(right, 'r--');