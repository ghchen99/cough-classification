#Cough Sound Detection System for Chronic Lung Condition Monitoring

This repository contains the code and relevant files for my final year programming project as part of my MEng Electronic and Information Engineering dissertation at Imperial College London. The aim of this project is to develop a cough sound detection system for the monitoring of patients with chronic lung conditions, specifically focusing on patients with asthma and chronic obstructive pulmonary disease (COPD).

##Project Overview
The project addresses the need for accurately identifying and distinguishing cough sounds from other background noises in order to monitor the cough frequency of COPD patients. The detection system aims to recognize cough sounds originating from the specific patient being monitored, enhancing the effectiveness of the monitoring process and potentially reducing hospitalization rates.

##Data Collection
A custom Android application was developed to collect the necessary data. The application records stereo sound using the built-in microphone array of the device and exports live accelerometer sensor data at a sampled rate. This data collection process acts as a proof of concept for the non-contact and unobtrusive characteristics of the system.

Preprocessing and Feature Extraction
The audio signals collected were preprocessed and segmented using silence removal techniques to isolate the cough sounds. Although data engineering was not the primary focus of this project, preprocessing was essential to improve the accuracy of subsequent steps. Prominent data features were then extracted using Mel-frequency Cepstral Coefficients (MFCC), Direction of Arrival (DOA), and other signal processing algorithms.

##Classification Methods
Machine learning methods were employed to classify each audio segment as either "of interest" (cough sound) or "background noise." The project explored two classification approaches: supervised and unsupervised learning.

##Supervised Learning
In the supervised learning approach, a labeled dataset was used to train a classifier. Mel Spectrogram analysis was applied to extract relevant features from the audio segments, and various machine learning algorithms were tested and evaluated for their classification performance.

##Unsupervised Learning
The unsupervised learning approach aimed to automatically discover patterns and clusters in the data without prior labeling. Similar to the supervised approach, Mel Spectrogram analysis was performed, and clustering algorithms were used to differentiate cough sounds from background noises.

Both the supervised and unsupervised methods achieved an impressive accuracy of up to 100% on testing data, showcasing the potential effectiveness of the cough sound detection system.

##Repository Structure
- data/: Contains the raw and preprocessed audio data used in the project.
- scripts/: Includes the Python scripts for data preprocessing, feature extraction, and classification.
- models/: Contains the trained models or model checkpoints for both supervised and unsupervised learning approaches.
- results/: Stores the evaluation results, including accuracy metrics, visualizations, and any relevant analysis.

##Usage
To replicate or further develop this project, follow these steps:

1. Clone this repository: git clone https://github.com/yourusername/your-repo.git
2. Install the required dependencies using pip or conda. Ensure you have Python 3.x.
3. Access the relevant code files in the scripts/ directory and modify them as needed.
4. Execute the scripts in the recommended order to preprocess the data, extract features, and train the classifiers.
5. Use the trained models to classify new audio segments or evaluate the performance on your own datasets.
6. Explore the results/ directory for evaluation metrics, visualizations, and any additional analysis conducted.

##Contributions and Acknowledgements
This project was developed as part of my MEng Electronic and Information Engineering dissertation at Imperial College London. Acknowledgements go to Professor Esther Rodriguez-Villegas for their guidance and support throughout the project.

If you would like to contribute to this project, feel free to submit pull requests or open issues with any suggestions or improvements.

License
This project is licensed under the MIT License. Feel free to use and modify the code as needed, but please include attribution to the original authors.
