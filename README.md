# Ghost CMS extended image

## About
Extending the post excerpt capacity to use it as a custom field.
- Default length - 300
- New length - 1500
- Max availible length - 2000

Dockerfile modifies the ghost cms source image by increasing the length of the `custom_excerpt` field to 1500 characters. This field can be called anywhere in the post context, allowing you to use it as a custom field for your needs. 

The solution was tested with version `5.75.0`, but most likely will work with other versions as well.

## Deploy
You can run docker compose for fast deploy
```
docker compose up -d 
```
or just build image and use it later
```
docker build .
```

## Usage example
An example use case can be seen below:

Set custom_excerpt value: 

`{"name":"John","title":"Example","sub1":"Hi there","sub2":"There is default json object in string view"}`

And customise post-card.hbs in your theme files:
```post-card.hbs
<article id={{slug}} class="post-card-m {{post_class}}">
</article>
<script>
    function fillCard() {
        const a = {{excerpt}};
        const defaultTitle = '{{title}}';
        let html = `
            <div class="post-card-link-m">
                {{#if feature_image}}
                    <img class="post-card-bg"
                         srcset="{{img_url feature_image size="s"}} 300w,
                                {{img_url feature_image size="m"}} 600w,
                                {{img_url feature_image size="l"}} 1200w,
                                {{img_url feature_image size="xl"}} 2000w,
                                {{img_url feature_image}}"
                         sizes="(min-width: 701px) {{#has number="nth:3"}}94vw{{else}}calc(94vw / 2){{/has}}, 88vw"
                         src="{{img_url feature_image size="l"}}"
                         alt="{{title}}"
                    >
                {{/if}}
                <div class="post-card-content-m">
                    <div class="post-card-row-main">
                        <div class="post-card-row1">
                            <p>${a.name? a.name:""}</p>
                            <a class="post-arrow-link-m" href="{{url}}">
                            <img class="post-card-arrow" src="/assets/images/arrow.svg" alt="arrow">
                            </a>
                        </div>
                        <div class="post-card-row2">
                            <h3 class="post-card-title-m">${a.title ? a.title : defaultTitle }</h3>
                        </div>
                    </div>
                    <div class="post-card-row3">
                        <p class="default">${a.sub1 ? a.sub1 : ""}</p>
                        <p class="hover">${a.sub2 ?a.sub2: a.sub1 ? a.sub1: ""}</p>
                    </div>
                </div>
            </div>
            `
        document.getElementById('{{slug}}').innerHTML = html;
    }
   fillCard()
</script>
```
