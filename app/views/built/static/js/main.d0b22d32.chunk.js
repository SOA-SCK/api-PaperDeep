(this["webpackJsonpview-app"]=this["webpackJsonpview-app"]||[]).push([[0],{100:function(e,t,c){"use strict";c.r(t);var n=c(0),r=c.n(n),i=c(18),s=c.n(i),a=(c(61),c(15)),j=c(16),l=c(8),A=c(106),d=c(108),b=c(6),h=c.n(b),o=c(14),O=c(28),x=c.n(O),u=c(102),p=c(103),g=c(51),f=c(107),y=c(52),w=c(104),k=c(105),m=(c.p,c(1));var v,B=function(e){var t=Object(l.f)().search,c=x.a.parse(t),r=Object(n.useState)(!1),i=Object(a.a)(r,2),s=i[0],A=(i[1],Object(n.useState)("")),d=Object(a.a)(A,2),b=d[0],O=d[1],v=Object(n.useState)([]),B=Object(a.a)(v,2),I=B[0],C=B[1];function E(e){return Q.apply(this,arguments)}function Q(){return Q=Object(o.a)(h.a.mark((function t(c){var n;return h.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:if(c){t.next=3;break}return alert("query con not be null!"),t.abrupt("return");case 3:n={method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({keyword:c})},e.setLoading(!0);try{fetch("http://localhost:9292/search",n).then(function(){var t=Object(o.a)(h.a.mark((function t(c){var n;return h.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,c.json();case 2:n=t.sent,C(n),e.setLoading(!1);case 5:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}())}catch(r){console.log(r.message)}case 6:case"end":return t.stop()}}),t)}))),Q.apply(this,arguments)}return Object(n.useEffect)((function(){console.log(c.query),c.query&&(E(c.query),O(c.query))}),[s]),Object(m.jsxs)(m.Fragment,{children:[Object(m.jsx)("br",{}),Object(m.jsx)("div",{className:"App",children:Object(m.jsx)("h1",{children:"Paper Search"})}),Object(m.jsx)("br",{}),Object(m.jsxs)(u.a,{children:[Object(m.jsxs)(p.a,{children:[Object(m.jsx)(g.a,{}),Object(m.jsx)(g.a,{xs:8,children:Object(m.jsx)(f.a,{children:Object(m.jsxs)(p.a,{children:[Object(m.jsx)(g.a,{sm:"9",children:Object(m.jsx)(y.a,{type:"text",placeholder:"Search Study Fields",value:b,onChange:function(e){O(e.target.value)}})}),Object(m.jsx)(g.a,{sm:"3",children:Object(m.jsx)(w.a,{variant:"outline-primary",onClick:function(){E(b)},children:"Search"})})]})})}),Object(m.jsx)(g.a,{})]}),Object(m.jsx)(p.a,{children:Object(m.jsxs)(k.a,{striped:!0,bordered:!0,hover:!0,size:"sm",style:{width:"100%",margin:"auto",marginTop:"1%"},children:[Object(m.jsx)("thead",{children:Object(m.jsxs)("tr",{children:[Object(m.jsx)("th",{children:"#"}),Object(m.jsx)("th",{children:"Title"}),Object(m.jsx)("th",{children:"Lead Author"}),Object(m.jsx)("th",{children:"Organization"}),Object(m.jsx)("th",{children:"Paper Link"}),Object(m.jsx)("th",{children:"Citedby"})]})}),Object(m.jsx)("tbody",{children:I.map((function(e,t){return Object(m.jsxs)("tr",{children:[Object(m.jsx)("td",{width:"3%",children:t}),Object(m.jsx)("td",{children:e.title}),Object(m.jsx)("td",{width:"10%",children:e.author}),Object(m.jsx)("td",{width:"15%",overflow:"hidden",children:e.organization}),Object(m.jsx)("td",{width:"10%",children:Object(m.jsx)("a",{href:e.paper_link,target:"_blank",children:"Scopus link"})}),Object(m.jsx)("td",{width:"10%",children:Object(m.jsx)(j.b,{to:"/citedResult/?query=".concat(e.eid),children:e.citedby})})]},t)}))})]})})]})]})},I=c(30),C=c(7),E=c(31);var Q,S=function(){var e=E.a.div(v||(v=Object(I.a)(["\n  padding: 5px;\n  border-radius: 8px;\n  display: inline-block;\n  border: 1px solid red;\n"]))),t=function(){return Object(m.jsxs)(C.a,{lineWidth:"2px",lineColor:"green",lineBorderRadius:"10px",label:Object(m.jsx)(e,{children:"Root"}),children:[Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Child 1"}),children:Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Grand Child"})})}),Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Child 2"}),children:Object(m.jsxs)(C.b,{label:Object(m.jsx)(e,{children:"Grand Child"}),children:[Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Great Grand Child 1"})}),Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Great Grand Child 2"})})]})}),Object(m.jsxs)(C.b,{label:Object(m.jsx)(e,{children:"Child 3"}),children:[Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Grand Child 1"})}),Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Grand Child 2"})})]})]})};return Object(m.jsx)(m.Fragment,{children:Object(m.jsxs)("div",{className:"App",children:[Object(m.jsx)("h1",{children:"CitationTree"}),Object(m.jsx)(t,{})]})})};var M=function(){var e=E.a.div(Q||(Q=Object(I.a)(["\n  padding: 5px;\n  border-radius: 8px;\n  display: inline-block;\n  border: 1px solid red;\n"]))),t=function(){return Object(m.jsxs)(C.a,{lineWidth:"2px",lineColor:"green",lineBorderRadius:"10px",label:Object(m.jsx)(e,{children:"Root"}),children:[Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Child 1"}),children:Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Grand Child"})})}),Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Child 2"}),children:Object(m.jsxs)(C.b,{label:Object(m.jsx)(e,{children:"Grand Child"}),children:[Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Great Grand Child 1"})}),Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Great Grand Child 2"})})]})}),Object(m.jsxs)(C.b,{label:Object(m.jsx)(e,{children:"Child 3"}),children:[Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Grand Child 1"})}),Object(m.jsx)(C.b,{label:Object(m.jsx)(e,{children:"Grand Child 2"})})]})]})};return Object(m.jsx)(m.Fragment,{children:Object(m.jsxs)("div",{className:"App",children:[Object(m.jsx)("h1",{children:"CitationTree"}),Object(m.jsx)(t,{})]})})};var R=function(e){var t=Object(l.f)().search,c=x.a.parse(t),r=Object(n.useState)(!1),i=Object(a.a)(r,2),s=i[0],A=i[1],d=Object(n.useState)(""),b=Object(a.a)(d,2),O=(b[0],b[1]),f=Object(n.useState)([]),y=Object(a.a)(f,2),w=y[0],v=y[1],B=Object(n.useState)(null),I=Object(a.a)(B,2),C=I[0],E=I[1],Q=Object(n.useState)(null),S=Object(a.a)(Q,2),M=S[0],R=S[1];function T(e){return q.apply(this,arguments)}function q(){return q=Object(o.a)(h.a.mark((function t(c){var n,r,i=arguments;return h.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:if(n=!(i.length>1&&void 0!==i[1])||i[1],c){t.next=4;break}return alert("query con not be null!"),t.abrupt("return");case 4:r={method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({keyword:c})},n&&e.setLoading(!0);try{fetch("http://localhost:9292/search",r).then(function(){var t=Object(o.a)(h.a.mark((function t(c){var r;return h.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,c.json();case 2:r=t.sent,v(r),n&&e.setLoading(!1);case 5:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}())}catch(s){console.log(s.message)}case 7:case"end":return t.stop()}}),t)}))),q.apply(this,arguments)}function G(){return G=Object(o.a)(h.a.mark((function t(){var c,n,r=arguments;return h.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:if(c=!(r.length>0&&void 0!==r[0])||r[0],C){t.next=4;break}return alert("originPaper con not be null!"),t.abrupt("return");case 4:n={method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({pid:C.publication_id.toString()})},console.log(n),c&&e.setLoading(!0);try{fetch("http://localhost:9292/search/publication",n).then(function(){var t=Object(o.a)(h.a.mark((function t(n){var r;return h.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,n.json();case 2:r=t.sent,console.log(r),R(r[0]),c&&e.setLoading(!1);case 6:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}())}catch(i){console.log(i.message)}case 8:case"end":return t.stop()}}),t)}))),G.apply(this,arguments)}function L(e,t){return J.apply(this,arguments)}function J(){return(J=Object(o.a)(h.a.mark((function t(c,n){return h.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return e.setLoading(!0),t.next=3,T(n,!1);case 3:return t.next=5,F(n,!1);case 5:e.setLoading(!1),O(n);case 7:case"end":return t.stop()}}),t)})))).apply(this,arguments)}function F(e){return U.apply(this,arguments)}function U(){return U=Object(o.a)(h.a.mark((function t(c){var n,r,i=arguments;return h.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:if(n=!(i.length>1&&void 0!==i[1])||i[1],c){t.next=4;break}return alert("query con not be null!"),t.abrupt("return");case 4:r={method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({eid:c})},n&&e.setLoading(!0);try{fetch("http://localhost:9292/db/eid",r).then(function(){var t=Object(o.a)(h.a.mark((function t(c){var r;return h.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,c.json();case 2:r=t.sent,E(r),console.log(r),n&&e.setLoading(!1);case 6:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}())}catch(s){console.log(s.message)}case 7:case"end":return t.stop()}}),t)}))),U.apply(this,arguments)}return Object(n.useEffect)((function(){console.log(c.query),!s&&c.query&&(L("",c.query),A(!0)),C&&function(){G.apply(this,arguments)}(!0)}),[s,C]),Object(m.jsxs)(m.Fragment,{children:[Object(m.jsx)("br",{}),Object(m.jsx)("div",{className:"App",children:Object(m.jsx)("h1",{children:"Cited Papers of"})}),Object(m.jsx)("br",{}),Object(m.jsxs)(u.a,{children:[Object(m.jsxs)(p.a,{children:[Object(m.jsx)(g.a,{}),C?Object(m.jsx)(g.a,{xs:10,children:Object(m.jsx)("h2",{children:Object(m.jsx)("a",{href:C.paper_link,target:"_blank",children:C.title})})}):"",Object(m.jsx)(g.a,{})]}),M?Object(m.jsxs)(m.Fragment,{children:[Object(m.jsxs)(p.a,{children:[Object(m.jsx)(g.a,{}),Object(m.jsxs)(g.a,{children:[Object(m.jsx)("b",{children:"Citation Count"})," : ",M.citation_count]}),Object(m.jsxs)(g.a,{children:[Object(m.jsx)("b",{children:"View Count"})," : ",M.views_count]}),Object(m.jsxs)(g.a,{children:[Object(m.jsx)("b",{children:"publication year"})," : ",M.publication_year]}),Object(m.jsx)(g.a,{})]}),Object(m.jsxs)(p.a,{children:[Object(m.jsx)(g.a,{}),Object(m.jsxs)(g.a,{children:[Object(m.jsx)("b",{children:"Publication"})," : ",M.source_title]}),Object(m.jsxs)(g.a,{children:[Object(m.jsx)("b",{children:"journal impact"})," : ",M.journal_impact]}),Object(m.jsx)(g.a,{})]})]}):Object(m.jsx)(m.Fragment,{}),Object(m.jsx)(p.a,{children:Object(m.jsxs)(k.a,{striped:!0,bordered:!0,hover:!0,size:"sm",style:{width:"85%",margin:"auto",marginTop:"1%"},children:[Object(m.jsx)("thead",{children:Object(m.jsxs)("tr",{children:[Object(m.jsx)("th",{children:"#"}),Object(m.jsx)("th",{children:"Title"}),Object(m.jsx)("th",{children:"Lead Author"}),Object(m.jsx)("th",{children:"Organization"}),Object(m.jsx)("th",{children:"Paper Link"}),Object(m.jsx)("th",{children:"Citedby"})]})}),Object(m.jsx)("tbody",{children:w.map((function(e,t){return Object(m.jsxs)("tr",{children:[Object(m.jsx)("td",{width:"3%",children:t}),Object(m.jsx)("td",{children:e.title}),Object(m.jsx)("td",{width:"15%",children:e.author}),Object(m.jsx)("td",{width:"15%",overflow:"hidden",children:e.organization}),Object(m.jsx)("td",{width:"10%",children:Object(m.jsx)("a",{href:e.paper_link,target:"_blank",children:"Scopus link"})}),Object(m.jsx)("td",{width:"10%",children:Object(m.jsx)(j.b,{to:"/citedResult/?query=ref(".concat(e.eid,")"),onClick:function(){L("/citedResult/?query=ref(".concat(e.eid,")"),"ref(".concat(e.eid,")"))},children:e.citedby})})]},t)}))})]})})]})]})},T=c(54),q=c.n(T);c(99);var G=function(){var e=Object(n.useState)(!1),t=Object(a.a)(e,2),c=t[0],r=t[1];return Object(m.jsxs)(m.Fragment,{children:[Object(m.jsx)("link",{rel:"stylesheet",href:"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css",integrity:"sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk",crossOrigin:"anonymous"}),Object(m.jsx)(j.a,{children:Object(m.jsx)(q.a,{active:c,spinner:!0,text:"Loading...",children:Object(m.jsxs)("div",{style:{height:"100vh"},children:[Object(m.jsxs)(A.a,{bg:"dark",variant:"dark",children:[Object(m.jsxs)(A.a.Brand,{href:"/",children:[Object(m.jsx)("img",{alt:"",src:"data:image/jpeg;base64,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",width:"30",height:"30",className:"d-inline-block align-top"})," ","PaperDeep"]}),Object(m.jsxs)(d.a,{children:[Object(m.jsx)(d.a.Item,{children:Object(m.jsx)(j.b,{to:"/",style:{color:"white"},children:"Search"})}),"\xa0\xa0",Object(m.jsx)(d.a.Item,{children:Object(m.jsx)(j.b,{to:"/citedResult",style:{color:"white"},children:"CitedResult"})}),"\xa0\xa0",Object(m.jsx)(d.a.Item,{children:Object(m.jsx)(j.b,{to:"/citationTree",style:{color:"white"},children:"CitationTree"})}),"\xa0\xa0",Object(m.jsx)(d.a.Item,{children:Object(m.jsx)(j.b,{to:"/beta",style:{color:"white"},children:"Beta"})})]})]}),Object(m.jsxs)(l.c,{children:[Object(m.jsx)(l.a,{path:"/citedResult",children:Object(m.jsx)(R,{setLoading:r})}),Object(m.jsx)(l.a,{path:"/citationTree",children:Object(m.jsx)(S,{setLoading:r})}),Object(m.jsx)(l.a,{path:"/beta",children:Object(m.jsx)(M,{setLoading:r})}),Object(m.jsx)(l.a,{path:"/",children:Object(m.jsx)(B,{setLoading:r})})]})]})})})]})},L=function(e){e&&e instanceof Function&&c.e(3).then(c.bind(null,109)).then((function(t){var c=t.getCLS,n=t.getFID,r=t.getFCP,i=t.getLCP,s=t.getTTFB;c(e),n(e),r(e),i(e),s(e)}))};s.a.render(Object(m.jsx)(r.a.StrictMode,{children:Object(m.jsx)(G,{})}),document.getElementById("root")),L()},61:function(e,t,c){},99:function(e,t,c){}},[[100,1,2]]]);
//# sourceMappingURL=main.d0b22d32.chunk.js.map