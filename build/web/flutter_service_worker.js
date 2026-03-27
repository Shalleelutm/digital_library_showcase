'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "77436239ccc83341188c3baaaeb72281",
"assets/AssetManifest.bin.json": "eadba735c8a7b0bdf6d8bc900cabd458",
"assets/assets/books/bhavish_engineering_book.jpeg": "910602c6f9dcb36205a8f3f924a5fca4",
"assets/assets/books/economics_book.jpg": "b1f60ac72dca9abf34d53f0bccaf7074",
"assets/assets/books/fiction.jpg": "910602c6f9dcb36205a8f3f924a5fca4",
"assets/assets/books/hemal_travel_guide.jpg": "5a3fb7d23980a0a72ccedb2005f291c7",
"assets/assets/books/ishan_science_book.jpeg": "e01a630c8a42689e42b9801f3ffc25a7",
"assets/assets/books/linux_for_fun.jpg": "1546c09f457e42f59c8bcb1e9847798f",
"assets/assets/books/pride_and_prejudice.jpg": "d80f4381f5301673e3e163e01d05e7c8",
"assets/assets/books/science_fingerprints.jpg": "50966808bf5803203edfa3850be808ae",
"assets/assets/books/travel.jpg": "1bff8e11787eb36ef728f97fc7892e06",
"assets/assets/books/war_and_peace.jpg": "a587db3d397e281ee36e810200557762",
"assets/assets/images/ai_learning.jpg": "2f4b21745e4bbde47b273d0ea554028f",
"assets/assets/images/balloon.png": "62657f89c2c5247a398a7b625692536a",
"assets/assets/images/bhavish.jpg": "cf346572f1b7d11c23528424e21d9a09",
"assets/assets/images/books_background.jpg": "22c658143043e2b8b0172ff90cdcf896",
"assets/assets/images/categories_background.jpg": "65c62bbca6cbdccc470e19e71a4030ae",
"assets/assets/images/engineering.jpg": "b487d3fcd0ed9711dd0317734db4263c",
"assets/assets/images/harry_potter.jpg": "5d5eac0eefb9d2c6ac863fd57f586fff",
"assets/assets/images/hemal.jpg": "ea0bb6a27d8de723452a6a510dd0c086",
"assets/assets/images/history.jpg": "7840fa9fb7bd06ba1777b9bd1475c8ab",
"assets/assets/images/ishan.jpg": "68d6a5bc55703162cdeeb4f95e2a7fd0",
"assets/assets/images/library_banner.jpg": "b09bb2a4355368a7d5c923df4c600085",
"assets/assets/images/library_interior.jpg": "d390b1847e052d48bbe485e4129c1b9e",
"assets/assets/images/library_welcome.jpg": "aa55801da10222ff1ba42374c1007b54",
"assets/assets/images/matrix_background.jpg": "b3674e6a27809e247f0898554cd8008e",
"assets/assets/images/sample_book.jpg": "ef675cb2314a56fa8917e0576afff3db",
"assets/assets/images/science.jpg": "0ee34e0e59a344f8beb13646af5caebe",
"assets/assets/images/social.jpg": "e1ba55fa0b7314c3dbeefa41f3886397",
"assets/assets/images/technology.jpg": "b1c75becb68f52ee00841728901d07dc",
"assets/assets/images/welcome_background.jpg": "622d85676a9680e59a1d4258b3c1efa6",
"assets/assets/pdfs/economics_book.pdf": "8cf42a16c2cdd46e6e060e7dd116c633",
"assets/assets/pdfs/engineering.pdf": "2b7aeef86ccfc221ebff0d3358722ba1",
"assets/assets/pdfs/fiction.pdf": "2593f24fd93d35ba1403e042b2e53e0c",
"assets/assets/pdfs/hemal.pdf": "f0803b027c4982492479f5460d6d4f22",
"assets/assets/pdfs/linux_for_fun.pdf": "838d1769e4174c878750dfdcf4baecf2",
"assets/assets/pdfs/pride_and_prejudice.pdf": "477c413a2b776bfe25dd5fa2ab8accee",
"assets/assets/pdfs/science.pdf": "b8da54c878961ff7e417d87768aa1412",
"assets/assets/pdfs/science_fingerprints.pdf": "a0ae2800978c6f5057eefdfd86177128",
"assets/assets/pdfs/travel.pdf": "07dc2feff3042680b1323cd5c8041594",
"assets/assets/pdfs/war_and_peace.pdf": "e9269275c2b93bce4884526d70bee40f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/NOTICES": "7807e1ee7debfdd391c836270e61ba10",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "65e462a14fe606ff318dc6c5bb61526c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "dc697172679d931dd16f73fb806ba83c",
"/": "dc697172679d931dd16f73fb806ba83c",
"main.dart.js": "979ad7ee340ab48d90e94a2f5becf46d",
"manifest.json": "2ab2b8ca34e2dc649a927d9f7ff7ba3b",
"version.json": "f3c35c0206a747007509ed05ddb12ba1"};
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
