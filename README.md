# zepic.es

[![zepic.es](/assets/media/logo.png)](https://zepic.es/)


## STEPS


### Repositories


### Local

- Star Git LFS: `git lfs install`
- If new project (not fork):
  - Copy [zepic.es project files](https://github.com/zepicture/zepic.es)
  - `git submodule add https://github.com/lorensansol/sansoul.git themes/sansoul`
- Else if fork:
  - Download submódule theme files: `git submodule update --init --recursive`
- If you want use svg emojies:
  - `git submodule add https://github.com/lorensansol/sansoul-emojis.git layouts/partials/svg/emojis`
- Now you can see the run project in the browser with the `do server` comand
- `README.md` ⏩ edit baseURL ("zepic.es") + delete steps bit by bit
- Design
  - You can edit any file with the same structure of theme sansoul
  - GENERAL
    - `config.yml`
    - `data/*.{yml,md}`
  - IMG + LOGO + FAVICON
    - `assets/media/` folder ⏩ [Compress image tool](https://compressor.io/)
      - `fondo.jpg`
      - `logo.svg`
      - `logo.png`
      - `icon.png`
      - `favicon.ico` ⏩ [Favicon converter tool](https://favicon.io/favicon-converter/)
    - Gitlab, Github, Netlify and Cloudflare Pages update icon (project and account)
  - FONTS
    - Fonts that not be in Google Fonts:
      - .otf/.ttf files in `assets/fonts` + rename
      - You need the `sansoul_tools` project in `../_tools` folder
      - Run `do fonts` comand
      - `Family` + `Style` + `Weight` must match in `config.yml ⏩ params.fonts` + `_fonts.scss` (and disable `params.fonts.google` if appropriate)
  - CONTENT
    - `content/*`
      - `blog/divisores.md` ⏩ remove
      - `admin` ⏩ `draft: true` and/or change params and content
      - SCRAP
        - Copy [this Spreadsheet Layout](https://docs.google.com/spreadsheets/d/1bXK2OW_SYJK3u3SUO8KRoXUXr9kj42yehXw2O0UapEY/)
        - First scrap with Screaming Frog and paste `url` and `title`
        - Second scrap with `IMPORTXML` formula in `content-start` tab
        - If need HTML content
          - Three scrap with `Web Scraper` chrome extension and paste in `content-scrap` tab
          - Copy `content-start` tab into `content-next` and get `body_code` (by `content-scrap`) with `VLOOKUP` formula
          - Copy `body_code` column to `body`, [convert to Markdown](https://codebeautify.org/html-to-markdown) and clean it
        - Copy `content-next` to `content-export` without `url` and `body_code`
        - Export to CSV ⏩ [convert to YM](https://onlineyamltools.com/convert-csv-to-yaml) ⏩ paste in `./Downloads/DIR/pages.yml` and clean it + write `___` to split files
        - Execute `../_tools/yml-split.command`
        - Paste Markdown files in `blog`
  - HTML
    - `layouts/*`
    - `data/config.yml ⏩ custom_code.html_head.code`
    - `data/config.yml ⏩ custom_code.html_body.code`
  - CSS
    - `assets/css/*`
    - `assets/css/` ⏩ `_variables-custom.scss` + `_custom.scss`
    - `data/config.yml ⏩ custom_code.css.code`
  - JS
    - `assets/js/*`
    - `layouts/partials/sections/common/scripts.html`
    - `data/config.yml ⏩ custom_code.js.code`
  - IMG
    - `assets/media/*`
  - REDIRECTS
    - `assets/redirects.md`
  - ROBOTS
    - `assets/robots.md`
  - If Multilanguaje and Multihosting, add `cp ./public/[es|en]/404.html ./public/` in `netlify.toml ⏩ build.command`
  - Try in Safari and Firefox
  - Check in [W3 Validator](https://validator.w3.org/)
  - Check in [PageSpeed Insights](https://pagespeed.web.dev/)


### After client validate web


#### Domain

- If Netlify
  - [`Domain Management / settings`](https://app.netlify.com/sites/zepicture/settings/domain)
  - `Add custom domain`
  - `Check DNS configuration` Copy
  - Add `DNS Records` copied from Netlify to Domain gestor:
    - From: `zepic.es`
      DNS Record: `ALIAS`, `ANAME` or `flattened CNAME`
      To: `apex-loadbalancer.netlify.com`
    - From: `zepic.es`
      DNS Record: `A`
      To: `75.2.60.5`
    - From: `www`
      DNS Record: `CNAME`
      To: `zepicture.netlify.app.`
    - Maybe you need to eliminate the previous records with similar names
  - `Verify DNS configuration`
  - If it does not work after a while, try `Set as main domain` in the `www` version and also in te `nowww` version
- If Cloudflare Pages
  - [Custom domains](https://dash.cloudflare.com/?to=/:account/pages/view/zepicture/domains)
  - `Set up a custom domains`
  - `zepic.es`
  - `Continue`
  - `Activate domain` (if `Begin DNS transfer` end)
  - Repeat with `www.zepic.es`
  - ...........................................................


#### Forms

- If Netlify Form
  - Don't need configure nothing! Build like you want in local or with CMS
  - [`Netlify ⏩ Site ⏩ Forms ⏩ Form Notifications`](https://app.netlify.com/sites/zepicture/settings/forms#form-notifications) ⏩ `Add notification ⏩ Email notification ⏩ Email to Notify`
    - `Email to notify` = Emails of collaborators that want receive submissions
    - `Custom email subject line` = `Formulario de contacto de zepic.es`
    - `Save`
  - Submissions: [`Netlify site ⏩ Forms`](https://app.netlify.com/sites/zepicture/forms)
- If Cloudflare Workers
  - ...........................................................
- [formsubmit.co](https://formsubmit.co/)
- If Google Form: [Tutorial](https://seacomoseo.com/instrucciones/#google-forms)


#### [Google Analytics](https://analytics.google.com/)

- `Admin ⏩ Libre acount ⏩ New property ⏩ ...` copy ID
- `data/config.yml ⏩ google_analytics` ⏩ paste ID
- `Ajustes de datos`
  - `Recogida de datos`
    - `Recogida de datos de Google signals ⏩ Empezar`
    - `Consentimiento de recogida de datos de usuario` ⏩ Check
  - `Conservación de datos ⏩ Conservación de datos de eventos ⏩ 14 meses ⏩ Guardar`
- `Conversiones ⏩ Nuevo evento de conversión ⏩ Nombre de evento nuevo` ⏩ add `contact_click` and `contact_form_submit`


#### [Google Search Console](https://search.google.com/search-console)

- Add property
- Verify versions ⏩ `data/config.yml`
  - `google_analytics`
  - `google_site_verification`
  - `google_file_verification`
  - DNS:
    From: `@`
    DNS Record: `TXT`
    To: `google-site-verification=[google_site_verification]`
- Link with Analytics
- Add sitemap.xml


#### [Google My Business](https://business.google.com/)

- `Add company ⏩ ...` ⏩ whait 13 days to receive postal and insert code to verify


#### [Disqus](https://disqus.com/)

- `data/config.yml ⏩ disqus`


#### Collaborators

- [Google Analytics](https://analytics.google.com/) ⏩ `Admin ⏩ Libre acount ⏩ Site ⏩ Property access management ⏩ Add users` ⏩ Add emails of collaborators with role `Reader` or `Admin`.
- [Google Search Console](https://search.google.com/search-console) ⏩ `Site ⏩ Settings ⏩ Users and permissions ⏩ Add user` Add emails of collaborators with `Full` permission
- [Google My Business](https://business.google.com/)
  - `Site ⏩ Users ⏩ Add users` ⏩ Add emails of collaborators with role `Owner`


##### Services Layout

1. [Servicios zepic.es](https://drive.google.com/file/d/1trq28fMfEVwoZOk4ue0tJzAJDZtj64BK) ⏩ `File ⏩ Make a copy` ⏩ Select client directory.
1. Change the info.
1. `Share` ⏩ Add emails of collaborators with `Editor` permission.


##### Delivery

Send to all collaborators next:

```
*ENTREGA WEB zepic.es:* https://seacomoseo.com/entrega/
```

## GADS

### GA4

- Vincular:
  - `Herramientas y configuración`
  - `Cuentas vinculadas`
  - `Google Analytics (GA4) & Firebase ⏩ Detalles`
  - Buscar proyecto y ⏩ `Vincular`
- Importar conversiones:
  - `Herramientas y configuración`
  - `Medición`
  - `Conversiones`
  - `Nueva acción de conversión`
  - `Importar`
  - `Propiedades de Google Analytics 4`
  - `Web`
  - `Continuar`
  - Seleccionar `contact_click` y `contact_form_submit`
  - `Importar y continuar`
- Cambiar a `Maximizar conversiones`
  - `Campañas`
  - `⚙️`
  - `Puja`
  - `Cambiar estrategia de puja`
  - `¿En qué quieres centrarte? ⏩ Conversiones`
