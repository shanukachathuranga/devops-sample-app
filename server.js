// Import the Express framework module into our application
const express = require('express');

// Initialize a new Express application instance
const app = express();

// Define the port the server will listen on, using an environment variable if provided, otherwise defaulting to 3000
const PORT = process.env.PORT || 3000;

// Define a GET route for the root path ('/') that responds with a simple text message when accessed
app.get('/', (req, res) => {
    res.send('Hello Shanuka! The CI/CD Pipeline is working!');
});

// Instruct the Express app to start listening for incoming network requests on the specified PORT
app.listen(PORT, () => {
    // Print a confirmation message to the console so the developer knows the server has started successfully
    console.log(`Server is running on port ${PORT}`);
});
