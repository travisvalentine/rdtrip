/**
 *  Raphaël-ZPD: A zoom/pan/drag plugin for Raphaël.
 * ==================================================
 *
 * This code is licensed under the following BSD license:
 * 
 * Copyright 2010 Gabriel Zabusek <gabriel.zabusek@gmail.com> (Interface and feature extensions and modifications). All rights reserved.
 * Copyright 2010 Daniel Assange <somnidea@lemma.org> (Raphaël integration and extensions). All rights reserved.
 * Copyright 2009-2010 Andrea Leofreddi <a.leofreddi@itcharm.com> (original author). All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, are
 * permitted provided that the following conditions are met:
 * 
 *    1. Redistributions of source code must retain the above copyright notice, this list of
 *       conditions and the following disclaimer.
 * 
 *    2. Redistributions in binary form must reproduce the above copyright notice, this list
 *       of conditions and the following disclaimer in the documentation and/or other materials
 *       provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY Andrea Leofreddi ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Andrea Leofreddi OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * The views and conclusions contained in the software and documentation are those of the
 * authors and should not be interpreted as representing official policies, either expressed
 * or implied, of Andrea Leofreddi.
 */
var raphaelZPDId=0;RaphaelZPD=function(a,b){function c(){return document.implementation.hasFeature("http://www.w3.org/TR/SVG11/feature#BasicStructure","1.1")}function e(a){var b=["circle","rect","ellipse","image","text","path"];for(var c=0;c<b.length;c++)f(a,b[c])}function f(a,b){a[b]=function(b){return function(){var c=b.apply(a,arguments);return c.gelem=d.gelem,d.gelem.appendChild(c.node),c}}(a[b])}function g(a){if(typeof a.clientX!="number")return a;svgDoc=a.target.ownerDocument;var b=svgDoc.getElementById("viewport"+d.id),c=d.getEventPoint(a);return c=c.matrixTransform(b.getCTM().inverse()),a.zoomedX=c.x,a.zoomedY=c.y,a}if(!c())return null;var d=this;d.initialized=!1,d.opts={zoom:!0,pan:!0,drag:!0,zoomThreshold:null},d.id=++raphaelZPDId,d.root=a.canvas,d.gelem=document.createElementNS("http://www.w3.org/2000/svg","g"),d.gelem.id="viewport"+d.id,d.root.appendChild(d.gelem),e(a);var h=["click","dblclick","mousedown","mousemove","mouseout","mouseover","mouseup","touchstart","touchmove","touchend","orientationchange","touchcancel","gesturestart","gesturechange","gestureend"];h.forEach(function(a){var b=Raphael.el[a];Raphael.el[a]=function(a,c){if(a===undefined)return;var d=function(b){return a.apply(this,[g(b)])};return b.apply(this,[d,c])}}),d.state="none",d.stateTarget=null,d.stateOrigin=null,d.stateTf=null,d.zoomCurrent=0;if(b)for(key in b)d.opts[key]!==undefined&&(d.opts[key]=b[key]);d.setupHandlers=function(a){d.root.onmousedown=d.handleMouseDown,d.root.onmousemove=d.handleMouseMove,d.root.onmouseup=d.handleMouseUp,navigator.userAgent.toLowerCase().indexOf("webkit")>=0?d.root.addEventListener("mousewheel",d.handleMouseWheel,!1):d.root.addEventListener("DOMMouseScroll",d.handleMouseWheel,!1)},d.getEventPoint=function(a){var b=d.root.createSVGPoint();return b.x=a.clientX,b.y=a.clientY,b},d.setCTM=function(a,b){var c="matrix("+b.a+","+b.b+","+b.c+","+b.d+","+b.e+","+b.f+")";a.setAttribute("transform",c)},d.dumpMatrix=function(a){var b="[ "+a.a+", "+a.c+", "+a.e+"\n  "+a.b+", "+a.d+", "+a.f+"\n  0, 0, 1 ]";return b},d.setAttributes=function(a,b){for(i in b)a.setAttributeNS(null,i,b[i])},d.handleMouseWheel=function(a){if(!d.opts.zoom)return;a.preventDefault&&a.preventDefault(),a.returnValue=!1;var b=a.target.ownerDocument,c;a.wheelDelta?c=a.wheelDelta/3600:c=a.detail/-90;if(c>0){if(d.opts.zoomThreshold&&d.opts.zoomThreshold[1]<=d.zoomCurrent)return;d.zoomCurrent++}else{if(d.opts.zoomThreshold&&d.opts.zoomThreshold[0]>=d.zoomCurrent)return;d.zoomCurrent--}var e=1+c,f=b.getElementById("viewport"+d.id),g=d.getEventPoint(a);g=g.matrixTransform(f.getCTM().inverse());var h=d.root.createSVGMatrix().translate(g.x,g.y).scale(e).translate(-g.x,-g.y);d.setCTM(f,f.getCTM().multiply(h)),d.stateTf||(d.stateTf=f.getCTM().inverse()),d.stateTf=d.stateTf.multiply(h.inverse())},d.handleMouseMove=function(a){a.preventDefault&&a.preventDefault(),a.returnValue=!1;var b=a.target.ownerDocument,c=b.getElementById("viewport"+d.id);if(d.state=="pan"){if(!d.opts.pan)return;var e=d.getEventPoint(a).matrixTransform(d.stateTf);d.setCTM(c,d.stateTf.inverse().translate(e.x-d.stateOrigin.x,e.y-d.stateOrigin.y))}else if(d.state=="move"){if(!d.opts.drag)return;var e=d.getEventPoint(a).matrixTransform(c.getCTM().inverse());d.setCTM(d.stateTarget,d.root.createSVGMatrix().translate(e.x-d.stateOrigin.x,e.y-d.stateOrigin.y).multiply(c.getCTM().inverse()).multiply(d.stateTarget.getCTM())),d.stateOrigin=e}},d.handleMouseDown=function(a){a.preventDefault&&a.preventDefault(),a.returnValue=!1;var b=a.target.ownerDocument,c=b.getElementById("viewport"+d.id);if(a.target.tagName=="svg"||!d.opts.drag){if(!d.opts.pan)return;d.state="pan",d.stateTf=c.getCTM().inverse(),d.stateOrigin=d.getEventPoint(a).matrixTransform(d.stateTf)}else{if(!d.opts.drag||a.target.draggable==0)return;d.state="move",d.stateTarget=a.target,d.stateTf=c.getCTM().inverse(),d.stateOrigin=d.getEventPoint(a).matrixTransform(d.stateTf)}},d.handleMouseUp=function(a){a.preventDefault&&a.preventDefault(),a.returnValue=!1;var b=a.target.ownerDocument;if(d.state=="pan"&&d.opts.pan||d.state=="move"&&d.opts.drag)d.state=""},d.setupHandlers(d.root),d.initialized=!0},Raphael.fn.ZPDPanTo=function(a,b){var c=this;if(c.gelem.getCTM()==null)return alert("failed"),null;var d=c.gelem.getCTM().inverse(),e=document.getElementsByTagName("svg")[0];e.createSVGPoint||alert("no svg");var f=e.createSVGPoint();f.x=a,f.y=b,f=f.matrixTransform(d);var g=c.gelem,h=d.inverse().translate(f.x,f.y),i="matrix("+h.a+","+h.b+","+h.c+","+h.d+","+h.e+","+h.f+")";return g.setAttribute("transform",i),c};