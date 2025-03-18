// Go to website upon click
function openPage(url) {
  window.open(url, '_blank');
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

// TODO: toggable (open-closed) table of contents
