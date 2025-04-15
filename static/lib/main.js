// Go to website upon click (new tab)
function openPage(url) {
  window.open(url, '_blank');
};

// Go to website upon click (same tab)
function openPage(url) {
  window.location.href = url;
};

// Copy-to-clipboard button
function copyToClipboard() {
  // Get the paragraph element
  var textElement = document.getElementById("codeblock");
  // Copy the text inside the paragraph element
  navigator.clipboard.writeText(textElement.innerText)
    .then(() => {
      console.log("Text copied to clipboard successfully!");
    })
    .catch(err => {
      console.error("Failed to copy text: ", err);
    });
}
