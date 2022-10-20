const richResultsSpeakable = (url, title) => {
  const speakable = {
    '@context': 'https://schema.org/',
    '@type': 'WebPage',
    name: title,
    speakable: {
      '@type': 'SpeakableSpecification',
      cssSelector: ['.speakable'],
    },
    url: url,
  }

  return JSON.stringify(speakable, null, 2)
}

module.exports = richResultsSpeakable

/*
<script type="application/ld+json">
    {
     "@context": "https://schema.org/",
     "@type": "WebPage",
     "name": "Quick Brown Fox",
     "speakable":
     {
      "@type": "SpeakableSpecification",
      "xPath": [
        "/html/head/title",
        "/html/head/meta[@name='description']/@content"
        ]
      },
     "url": "http://www.quickbrownfox_example.com/quick-brown-fox"
     }
    </script>
    */
