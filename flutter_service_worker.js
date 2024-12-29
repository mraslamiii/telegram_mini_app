'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "ec9fbd7c4036d33b7e5829eda9da4c41",
"version.json": "d5313245ec700ce43b3881737644c7da",
"index.html": "58f6224e6d82cf27fd0d4e8f0512ed0f",
"/": "58f6224e6d82cf27fd0d4e8f0512ed0f",
"main.dart.js": "3062c33bf46766b6a782ea330bc3a270",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "a1492eb62c61e8f5ec151fe254781030",
"assets/asset/icon.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/mobile.gif": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/blue.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/AssetManifest.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/NOTICES": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/logo.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/FontManifest.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/AssetManifest.bin.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-MediumItalic.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-Light.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-Medium.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-ExtraBoldItalic.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-SemiBold.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-SemiBoldItalic.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-ExtraLightItalic.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-Regular.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-LightItalic.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-Bold.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-ExtraLight.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-ExtraBold.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-Italic.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/font/PlusJakartaSans-BoldItalic.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/AssetManifest.bin": "d41d8cd98f00b204e9800998ecf8427e",
"assets/asset/red.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/AssetManifest.json": "95c57cb9c83815c46c2d22cebe5d60d8",
"assets/NOTICES": "d538ac247c621d11aaca2c2cca146da7",
"assets/FontManifest.json": "f239c75cc6bd59deaaa3bb3fd0726a94",
"assets/AssetManifest.bin.json": "8f5ce064a761466f4cdc3a224f9a75e2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "5b3474eb976492b6f892cee5bf57df6c",
"assets/fonts/MaterialIcons-Regular.otf": "c9714baa3e73112b05aec56bd0279710",
"assets/assets/cars-encyclopedia-interaction.apk": "e3a64a8fe8f61616402056d898f13282",
"assets/assets/icon.png": "02bbfb4121f9efce6f7ff4a5924b148c",
"assets/assets/mobile.gif": "c475d01a3c94d6a5647865df86267a19",
"assets/assets/blue.png": "565fd17c126cad99a274a4fdd89d9b18",
"assets/assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/assets/mobile.mp4": "e1bbb713c2b1ebe286b782d203277334",
"assets/assets/video.mp4": "67a4a1887138277b24dbb69cea9c1ca9",
"assets/assets/NOTICES": "151b0bacf84aaf6bbb1b0550962540f9",
"assets/assets/logo.png": "8518e8fb36fd9da3938a29e9beb88fe0",
"assets/assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/assets/AssetManifest.bin.json": "69a99f98c8b1fb8111c5fb961769fcd8",
"assets/assets/font/PlusJakartaSans-MediumItalic.ttf": "6efa621b283ff999f05bc4d672de8c95",
"assets/assets/font/PlusJakartaSans-Light.ttf": "d6fb190614a9297c6263f85094463592",
"assets/assets/font/PlusJakartaSans-Medium.ttf": "9fb6d71fc9edf9db455adeb04da9795c",
"assets/assets/font/PlusJakartaSans-ExtraBoldItalic.ttf": "ba442a7aab453d20c5709ae7ca0837ac",
"assets/assets/font/PlusJakartaSans-SemiBold.ttf": "08d59825aa09f741c9272b85e6a1adbf",
"assets/assets/font/PlusJakartaSans-SemiBoldItalic.ttf": "9f3904d1769f5e804c644e59c203f447",
"assets/assets/font/PlusJakartaSans-ExtraLightItalic.ttf": "4a090ca0e9382ed4996f23042b335391",
"assets/assets/font/PlusJakartaSans-Regular.ttf": "f539ae4a8884822210a4553cc88ca3dc",
"assets/assets/font/PlusJakartaSans-LightItalic.ttf": "0bf00206fd7547022cfa3e0ec073e427",
"assets/assets/font/PlusJakartaSans-Bold.ttf": "7dae244963714ee2b16fcbab46661792",
"assets/assets/font/PlusJakartaSans-ExtraLight.ttf": "bd1c3b0ba032000f9e62c171bd0558eb",
"assets/assets/font/PlusJakartaSans-ExtraBold.ttf": "9bfdb6bb1fda2806463b64e44c5eaed9",
"assets/assets/font/PlusJakartaSans-Italic.ttf": "5d157c8d8e47cc6e2da60b8158e78ca8",
"assets/assets/font/PlusJakartaSans-BoldItalic.ttf": "fdbe93c588403b5c67963757775c98cb",
"assets/assets/AssetManifest.bin": "693635b5258fe5f1cda720cf224f158c",
"assets/assets/demo.gif": "70d80c4ae09e28e6633eaad0844e1d11",
"assets/assets/red.png": "5c7ca3329bd9f8a17f7817afb090a55b",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
