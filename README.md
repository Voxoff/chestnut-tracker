TECH DEBT

1. Refactor registrations and sessions controller (and views) to be inside a devise folder

2. Put highlight js in pack tag or better npm package

3. WTF is turbolinks vs DOMContentLoaded

4. Pre tag indenting

5. Google Page Insights API key


Tech Explanations for decisions
1. window.location.href https://stackoverflow.com/questions/1034621/get-the-current-url-with-javascript
2. For no JS: https://stackoverflow.com/questions/13079666/developing-a-tracking-pixel or IFRAME? https://docs.upclick.com/show/english/merchants/tracking/pixel_url_tracking.aspx


Problems with header idea
1. Access to certain pages prohibited based on access
2. Params
3. APIs
4. What about proxies and middleware and zipping by server?
5. Caching
6. Page weight is difficult: https://deviceatlas.com/blog/measuring-page-weight. Consider Sitespeed.io


Reassurance
We do not have to be that accurate
https://www.websitecarbon.com/how-does-it-work/
They use
    Data transfer over the wire
    Energy intensity of web data
    Energy source used by the data centre
    Carbon intensity of electricity
    Website traffic
