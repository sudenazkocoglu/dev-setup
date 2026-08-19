**Soru 1: `pip install` ile `uv add` arasında bağımlılık çözümlemesi (dependency resolution) açısından fark nedir?**

**Cevap:** 
`pip` geleneksel bir yöntemdir ve projeler büyüdükçe bağımlılıkları çözerken oldukça yavaş kalır, hatta sistem eksikliklerinde takılıp çöker. `uv` ise modern, Rust tabanlı ve çok hızlıdır; bağımlılık ağını milisaniyeler içerisinde çözer. Ayrıca `uv`, `pip` komutlarını tamamen kapsamakla birlikte, `venv` (sanat ortam) izolasyonunu otomatik yöneterek diğer projelerinizin zarar görmesini engeller ve sistemi korur.

**Soru 2: `__pycache__` neden `.gitignore` dosyasında olmalı?**

**Cevap:** 
`__pycache__`, Python kodunu çalıştırdığımızda bilgisayarın hızı artırmak için arka planda otomatik olarak ürettiği geçici (bytecode) dosyalardır. Bunlar her kullanıcının kendi makinesinde kod çalıştırıldığı an zaten yeniden oluşur. Bu yüzden bu geçici dosyaları GitHub'a yüklemek hem gereksiz dosya kalabalığına (boyut şişmesine) yol açar hem de başkasının bilgisayarında işe yaramaz. Git sadece bizim yazdığımız ana kaynak kodlarını takip etmelidir, bilgisayarın ürettiği geçici artıkları değil.

**Soru 3: Docker'da `COPY requirements.txt` ile `COPY .` sırasını neden ayırıyoruz?**

**Cevap:** 
Bu ayrım tamamen Docker'ın **katman önbellekleme (layer caching)** mekanizmasını verimli kullanmak içindir. `requirements.txt` dosyası nadiren değişir; ancak projedeki kaynak kodlarımız (`.`) sürekli güncellenir. Eğer her şeyi tek seferde kopyalasaydık, kodumuzda yapacağımız minik bir değişiklik bile Docker'ın önbelleğini bozacak ve yüzlerce megabaytlık kütüphaneleri her seferinde sıfırdan yeniden indirecekti. Önce `requirements` dosyasını kopyalayıp paketleri kurarak o ağır adımı önbelleğe alıyoruz; böylece sonraki build işlemlerinde sadece değişen kodlar saniyeler içinde ekleniyor.

**Soru 4: `git rebase` ile `git merge` arasındaki farkı ekip çalışması bağlamında anlat.**

**Cevap:** 
İkisi de dalları birleştirmek için kullanılır ancak geçmişi (history) sunma biçimleri farklıdır. `git merge`, iki dalı birleştirirken araya bir "merge commit" atarak geçmişin yapısını korur; bu yöntem güvenlidir ve kimsenin geçmişiyle oynanmadığı için kalabalık ekiplerde güvenlidir ancak tarihçe biraz dallanıp budaklanabilir. `git rebase` ise senin yaptığın değişiklikleri sanki ana dalın en güncel halinden şimdi başlamışsın gibi öne taşır ve tarihçeyi dümdüz, tertemiz bir çizgi haline getirir. Takım çalışmasında ana dallarda (main vb.) geçmişi değiştirdiği için tehlikeli olabilir, ancak kişisel çalışmalarda temiz bir Git geçmişi bırakmak için harikadır.
