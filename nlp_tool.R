# Install necessary libraries (run only once)
install.packages("tm")         # Text mining and preprocessing
install.packages("SnowballC")  # Stemming
install.packages("syuzhet")    # Sentiment analysis
install.packages("wordcloud")  # Word cloud generation
install.packages("RColorBrewer") # Professional color palettes

# Load the libraries
library(tm)
library(SnowballC)
library(syuzhet)
library(wordcloud)
library(RColorBrewer)

# Set the working directory
setwd("C:/Users/Maxim/OneDrive/Desktop/Applied Programming/NaturalLanguageProcessor")

# Function That Reads Text Data from a CSV File
read_text_data <- function(file_path) {
    if (!file.exists(file_path)) {
        stop("Error: The specified file does not exist!")
    }
    data <- read.csv(file_path, stringsAsFactors = FALSE)
    return(data$Text) # Assuming the column 'Text' contains the data
}

# Function for Text Preprocessing
preprocess_text <- function(text_data) {
    corpus <- VCorpus(VectorSource(text_data)) # Using VCorpus for better handling
    corpus <- tm_map(corpus, content_transformer(tolower)) # Convert to lowercase
    corpus <- tm_map(corpus, stripWhitespace) # Remove extra whitespace
    return(corpus)
}

# Function for Sentiment Analysis
analyze_sentiment <- function(preprocessed_text) {
    text_vector <- sapply(preprocessed_text, as.character) # Convert corpus to character vector
    sentiments <- get_nrc_sentiment(text_vector) # Perform sentiment analysis
    return(sentiments)
}

# Function to Generate a Word Cloud
generate_wordcloud <- function(corpus) {
    # Create TermDocumentMatrix
    dtm <- TermDocumentMatrix(corpus)
    word_matrix <- as.matrix(dtm)
    # Check if the TermDocumentMatrix is empty
    if (nrow(word_matrix) == 0) {
        cat("Warning: No words available for the word cloud. Please check your input data.\n")
        return(NULL)
    }
    word_freq <- sort(rowSums(word_matrix), decreasing = TRUE)
    # Generate Word Cloud
    wordcloud(
        words = names(word_freq), # Words
        freq = word_freq,         # Frequencies
        max.words = 100,          # Up to 100 words
        colors = brewer.pal(9, "Set3"), # Soft professional palette
        scale = c(3, 0.5),        # Dynamic scaling for word sizes
        random.order = FALSE,     # Center frequent words
        rot.per = 0.25            # Rotate 25% of words for variety
    )
}

# Function to Create a Sentiment Bar Plot
create_sentiment_plot <- function(sentiments) {
    sentiment_sums <- colSums(sentiments[, -c(1:2)]) # Summarize sentiment scores, excluding neg/pos

    # Adjust graphical parameters to increase bottom margin
    old_par <- par(mar = c(8, 4, 4, 2) + 0.1) # Further increased bottom margin for x-axis labels

    # Create a bar plot
    barplot(
        sentiment_sums,
        las = 2, # Rotate x-axis labels for readability
        col = brewer.pal(8, "Set3"), # Better color palette
        main = "Sentiment Analysis Summary", # Title
        ylab = "Frequency", # Y-axis label
        xlab = "Sentiment Categories", # X-axis label
        cex.names = 0.8 # Reduce font size of x-axis labels
    )

    # Reset graphical parameters to default
    par(old_par)
}

# Function to Save Processed Outputs
save_outputs <- function(preprocessed_text, sentiments) {
    writeLines(preprocessed_text, con = "preprocessed_text.txt")
    write.csv(sentiments, file = "sentiment_scores.csv", row.names = FALSE)
}

# Main Code
text_data <- c( # Sample data for testing
    "R is an amazing language for data analysis!",
    "I love creating projects in R.",
    "This project involves Natural Language Processing.",
    "I am not happy with the results of this analysis.",
    "This is awful and I am really upset.",
    "Great job! But there is room for improvement."
)

# Preprocess Text
cat("Starting text preprocessing...\n")
processed_corpus <- preprocess_text(text_data)
preprocessed_text <- sapply(processed_corpus, as.character)
print(preprocessed_text)

# Perform Sentiment Analysis
cat("\nPerforming sentiment analysis...\n")
sentiment_scores <- analyze_sentiment(processed_corpus)
print(sentiment_scores)

# Generate Word Cloud
cat("\nGenerating word cloud...\n")
dev.off() # Ensure no lingering graphics devices interfere
if (!is.null(generate_wordcloud(processed_corpus))) {
    cat("Word cloud generated successfully.\n")
}

# Generate Sentiment Plot
cat("\nCreating sentiment plot...\n")
dev.off() # Close previous graphics device before generating the plot
create_sentiment_plot(sentiment_scores)

# Save Outputs
cat("\nSaving outputs to files...\n")
save_outputs(preprocessed_text, sentiment_scores)

# Interactive Loop for CSV File Input
repeat {
    cat("\nEnter the path of the CSV file (or type 'exit' to quit): \n")
    file_path <- readline()

    if (tolower(file_path) == "exit") {
        cat("\nExiting the program. Goodbye!\n")
        break
    }

    if (file.exists(file_path)) {
        text_data <- read_text_data(file_path)
        processed_corpus <- preprocess_text(text_data)
        sentiment_scores <- analyze_sentiment(processed_corpus)
        dev.off() # Reset graphics before generating visuals
        if (!is.null(generate_wordcloud(processed_corpus))) {
            cat("Word cloud generated successfully.\n")
        }
        create_sentiment_plot(sentiment_scores)
        save_outputs(preprocessed_text, sentiment_scores)
    } else {
        cat("\nThe specified file does not exist. Please try again.\n")
    }
}