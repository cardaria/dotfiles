"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[7170],{39851:(e,n,t)=>{t.r(n),t.d(n,{HomeAdsFetcher:()=>w,default:()=>y});t(79024),t(43379),t(51234),t(97460),t(93577);var i=t(30758),r=t(3099),o=t(59213),u=t(12341),s=(t(77905),t(14662)),l=t(89923),d=t(41681),f=18e5;var c=1,a=.5,v={threshold:[0,a,c]};var b=t(86070),m=(0,i.lazy)((function(){return Promise.all([t.e(4151),t.e(7378),t.e(7599)]).then(t.bind(t,63152))})),h=(0,i.lazy)((function(){return Promise.all([t.e(4151),t.e(599)]).then(t.bind(t,56869))})),A=(0,i.lazy)((function(){return t.e(6665).then(t.bind(t,9338))}));function w(){var e,n=(0,r.bT)(),t=n.fetchAndSetHomeAd,w=n.setHomeAd,y=n.homeAd,E=n.previewHomeAd,S=n.setPreviewHomeAd,_=E||y,p=(0,o.y)(),H=p.homeAdElement,k=p.setHomeAdElement,g=_&&"then"in _,x=function(e){var n=e.target,t=(0,i.useState)("visible_unknown"),r=(0,u.A)(t,2),o=r[0],s=r[1];return(0,i.useEffect)((function(){if(n){var e=new IntersectionObserver((function(e){var n=(0,u.A)(e,1)[0].intersectionRatio;return s((function(){return n>=c?"visible_100":n>=a?"visible_50":n<a?"visible_0":"visible_unknown"}))}),v);return e.observe(n),function(){return e.disconnect()}}s("visible_unknown")}),[n]),{visibilityState:o}}({target:null!=H?H:void 0}),j=x.visibilityState;if((0,i.useEffect)((function(){return null==t||t(),function(){w(void 0),S(void 0)}}),[t,w,S]),function(e){var n=e.visibilityState,t=e.homeAdIsCurrentlyBeingFetched,o=(0,r.bT)().fetchAndSetHomeAd,c=(0,l.n)(),a=(0,s.$)(),v=(0,i.useState)(),b=(0,u.A)(v,2),m=b[0],h=b[1],A=(0,d.A)((function(){return!t&&(null==o?void 0:o())}));(0,i.useEffect)((function(){c&&a&&("visible_50"===n||"visible_100"===n)&&m&&Date.now()-m>=f&&A()}),[c,m,a,n,A]),(0,i.useEffect)((function(){t||h(Date.now())}),[t,h])}({visibilityState:j,homeAdIsCurrentlyBeingFetched:g}),!_||g)return null;var C="text/html"===(null===(e=_.display[0])||void 0===e?void 0:e.mimeType);return(0,b.jsx)(i.Suspense,{children:C?(0,b.jsx)(m,{homeAd:_,ref:k}):(0,b.jsx)(A,{homeAd:_,visibilityState:j,children:(0,b.jsx)(h,{homeAd:_,ref:k})})})}const y=w},59213:(e,n,t)=>{t.d(n,{H:()=>u,y:()=>o});var i=t(12341),r=t(30758);function o(){var e=(0,r.useState)(null),n=(0,i.A)(e,2);return{homeAdElement:n[0],setHomeAdElement:n[1]}}var u=r.forwardRef},14662:(e,n,t)=>{t.d(n,{$:()=>o});var i=t(12341),r=t(30758),o=function(){var e=(0,r.useState)(document.hasFocus()),n=(0,i.A)(e,2),t=n[0],o=n[1];return(0,r.useEffect)((function(){function e(){o(!0)}function n(){o(!1)}return window.addEventListener("focus",e),window.addEventListener("blur",n),function(){window.removeEventListener("focus",e),window.removeEventListener("blur",n)}}),[]),t}}}]);
//# sourceMappingURL=home-ads-fetcher.js.map