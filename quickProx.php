<?php
print ("passthru");
// Define the list of allowed domains
$allowedDomains = ['example.com', 'allowed-domain.com'];

// Function to forward HTTP GET requests
function proxyHttpGet($url) {
    $ch = curl_init($url);

    // Set curl options
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);

    // Execute the request
    $response = curl_exec($ch);

    // Check for errors
    if ($response === false) {
        echo 'Error: ' . curl_error($ch);
    }

    // Close the cURL session
    curl_close($ch);

    return $response;
}

// Function to forward HTTP POST requests
function proxyHttpPost($url, $postData) {
    $ch = curl_init($url);

    // Set curl options for POST request
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);

    // Execute the request
    $response = curl_exec($ch);

    // Check for errors
    if ($response === false) {
        echo 'Error: ' . curl_error($ch);
    }

    // Close the cURL session
    curl_close($ch);

    return $response;
}

// Check if a URL is provided in the request
if (isset($_GET['url'])) {
    $targetUrl = $_GET['url'];

    // Parse the target URL to extract the domain
    $parsedUrl = parse_url($targetUrl);
    $targetDomain = $parsedUrl['host'];
 
    // Check if the target domain is in the allowed domains list
    if (!in_array($targetDomain, $allowedDomains)) {  
die($allowedDomains);        
// Check if it's a GET or POST request
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {  
            // Handle GET request
            $result = proxyHttpGet($targetUrl);
        } elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Handle POST request
            $postData = file_get_contents("php://input");
            $result = proxyHttpPost($targetUrl, $postData);
        } else {
            $result = 'Unsupported request method';
        }

var_dump($result);
        // Output the result
        echo $result;
    } else {
        echo 'Access denied for this domain.';
    }
} else {
    echo 'Please provide a target URL.';
}

?>
