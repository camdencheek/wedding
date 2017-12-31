#!/bin/bash
for file in img/gallery/*; do
    dimensions=$( identify $file | cut -f3 -d' ' )
    width=$(echo $dimensions | cut -f1 -d'x')
    height=$(echo $dimensions | cut -f2 -d'x')
    
    cat << EOF
        <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
            <!-- Link to the big image, not mandatory, but usefull when there is no JS -->
            <a href="$file" data-caption="Sea side, south shore<br><em class='text-muted'>© Dominik Schröder</em>" data-width="$width" data-height="$height" itemprop="contentUrl">
              <!-- Thumbnail -->
              <img src="$file" itemprop="thumbnail" alt="Image description">
            </a>
        </figure>
EOF
done

