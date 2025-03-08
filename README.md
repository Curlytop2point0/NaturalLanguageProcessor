# Overview

My name is Maxim Person, and as a software engineer, I strive to deepen my understanding of data analysis and text processing by developing a Natural Language Processor using R. This project demonstrates the core concepts of natural language processing (NLP), such as text preprocessing, sentiment analysis, and data visualization.

The purpose of this software is to preprocess textual data, perform sentiment analysis to determine emotional content, and generate visualizations like word clouds and sentiment bar plots. This tool can analyze any dataset in a CSV format and outputs useful insights in a clear and user-friendly manner.

**Video Demonstration**: PLACE YOUTUBE VIDEO HERE

## Development Environment

- **Development Tools**: Visual Studio Code with R extension, integrated R terminal
- **Programming Language**: R (version 4.4.3)
- **Libraries**:
  - `tm` (Text Mining)
  - `syuzhet` (Sentiment Analysis)
  - `wordcloud` (Word Cloud Generation)
  - `RColorBrewer` (Color Palettes)

## Useful Websites

- [NRC Emotion Lexicon Documentation](http://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm)
- [RColorBrewer Guide](https://cran.r-project.org/web/packages/RColorBrewer/RColorBrewer.pdf)
- [What is R?](https://www.simplilearn.com/what-is-r-article)
- [what is R?](https://www.r-project.org/about.html)

## Features

- **Text Preprocessing**:
  - Cleans and prepares textual data by converting to lowercase, removing extra whitespace, and retaining meaningful punctuation and stopwords.
- **Sentiment Analysis**:
  - Uses the NRC Emotion Lexicon to compute scores for emotions like anger, joy, sadness, and trust.
  - Generates a summary of emotional content in the text dataset.
- **Word Cloud Visualization**:
  - Produces a visually engaging word cloud that highlights the most frequent words in the dataset.
- **Sentiment Bar Plot**:
  - Displays a clean and professional bar plot showing the frequency of each emotion detected in the dataset.
- **File Handling**:
  - Reads input from a CSV file with a `Text` column.
  - Saves outputs, including `preprocessed_text.txt` and `sentiment_scores.csv`.
- **Interactive Loop**:
  - Accepts multiple file inputs interactively, allowing users to analyze datasets one after the other.

## Usage

1. **Run the Script**:
   - Open your R console or Visual Studio Code with R extension.
   - Run the script to preprocess text, analyze sentiments, and generate visualizations.
2. **Input a CSV File**:
   - Prepare a CSV file with a column labeled `Text`.
   - Provide the file path when prompted by the program.
3. **Generated Outputs**:
   - `preprocessed_text.txt`: Contains the cleaned version of the text.
   - `sentiment_scores.csv`: Displays sentiment scores for emotions like anger, joy, and sadness.
   - Word Cloud: A visual representation of the most frequent words.
   - Sentiment Bar Plot: A bar plot summarizing sentiment frequencies.
4. **Interactive Mode**:
   - Run the program in a loop to analyze multiple files dynamically.
   - Type "exit" to gracefully end the program.

## Future Work

- **Error Handling**:
  - Improve error messages for invalid CSV file inputs.
- **Enhanced Sentiment Analysis**:
  - Incorporate additional lexicons like Bing or AFINN for more nuanced analysis.
- **Real-Time Interaction**:
  - Build a user interface or integrate with Shiny for real-time visualization.
- **Topic Modeling**:
  - Extend functionality to include advanced NLP tasks like topic modeling and named entity recognition.