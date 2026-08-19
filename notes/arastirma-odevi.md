Python Paket Yönetimi Çıkmazı: uv vs poetry vs pip-tools vs conda
Python ekosisteminde geliştirme yaparken en sık karşılaşılan sorunlardan biri "Benim bilgisayarımda çalışıyordu!" cümlesidir. Projeler büyüdükçe kütüphanelerin alt bağımlılıklarını yönetmek (dependency resolution) ve ortamları izole etmek, standart pip ve requirements.txt ikilisinin boyunu aşar. Bu noktada farklı mühendislik felsefesine sahip dört ana araç öne çıkmaktadır: Conda, Pip-tools, Poetry ve Uv. Peki hangi durumda hangisini seçmeliyiz?

1. Conda: Veri Biliminin Ağır İşçisi
Conda, sadece Python paketlerini değil, C/C++ kütüphanelerini (örneğin CUDA sürücüleri) ve işletim sistemi düzeyindeki bağımlılıkları da kurabilen kapsamlı bir ortam yöneticisidir.

Hangi Durumda Kullanılır? Makine öğrenmesi, derin öğrenme ve veri bilimi projelerinde. Eğer projeniz GPU donanımına ve kompleks C kütüphanelerine (TensorFlow, PyTorch) derinden bağlıysa Conda tartışmasız en iyi seçenektir.

Neden? Çünkü Python dışındaki dillerin bağımlılıklarını da çözer. Ancak çok yavaştır ve oluşturduğu ortamlar (environments) gigabaytlarca yer kaplar.

2. Pip-tools: Minimalist ve Standart
Pip-tools, pip'in üzerine inşa edilmiş basit ama etkili bir araç setidir. Geliştiricinin yazdığı ana kütüphaneleri alır ve pip-compile komutuyla tüm alt bağımlılıkları sürüm numaralarıyla birlikte kilitler (pinning).

Hangi Durumda Kullanılır? Karmaşık araçlar (Poetry/Conda) kullanmak istemediğiniz, Dockerize edilecek küçük veya orta ölçekli mikroservislerde.

Neden? Sisteme ekstra bir yük getirmez. Saf requirements.txt üretir, bu da Docker gibi üretim (production) ortamlarında kurulumu son derece standart ve sorunsuz hale getirir. Ancak sanal ortam (venv) yönetimini geliştiriciye bırakır.

3. Poetry: Geliştirici Dostu ve Yapısal
Poetry, paket yönetimi ve proje paketlemeyi (packaging) tek bir çatı altında birleştiren modern bir standarttır. Projenin anayasası sayılan pyproject.toml dosyasını kullanır ve poetry.lock ile mutlak bir tekrar edilebilirlik sağlar.

Hangi Durumda Kullanılır? Çok geliştiricili büyük web projelerinde (Django, FastAPI) veya kendi yazdığınız bir kütüphaneyi açık kaynak olarak (PyPI üzerinden) yayınlamak istediğinizde.

Neden? Geliştirici deneyimi (DX) mükemmeldir. Ancak çok fazla bağımlılığı olan projelerde "dependency resolution" (çözümleme) algoritması bazen dakikalarca sürebilir ve sistemi kilitleyebilir.

4. Uv: Yeni Nesil Hız Canavarı
Astral tarafından Rust diliyle yazılan Uv, pip ve pip-tools'un yerini almak üzere tasarlanmış, geleneksel araçlardan 10 ila 100 kat daha hızlı çalışan devrimsel bir araçtır.

Hangi Durumda Kullanılır? Hızın ve performansın kritik olduğu, CI/CD süreçlerinin (Sürekli Entegrasyon) sık çalıştığı modern tüm projelerde.

Neden? Sadece paketleri değil, Python sürümlerinin kendisini bile yönetebilir. Sanal ortam yönetimini otomatikleştirir ve bağımlılık çözümlemeyi milisaniyeler içinde yapar.

Saha Testi ve Ölçüm (Kişisel Deneyimim)
Bu araçlar arasındaki hız farkını teoriden pratiğe dökmek için kendi WSL (Ubuntu) terminalimde bir test gerçekleştirdim. Veri biliminin ağır kütüphanelerinden olan pandas'ı hiçbir önbellek kullanmadan (--no-cache) sıfırdan kurarak time komutuyla ölçümledim.

Geleneksel Pip Testi: İlk testimde standart python3 -m venv komutu ile ortam oluşturmaya çalıştım ancak WSL ortamında temel Linux bağımlılıkları (python3-venv) eksik olduğu için sistem çöktü. Geleneksel yöntemin daha ilk adımdan işletim sistemi farklılıklarına takılması, neden yeni nesil araçlara ihtiyaç duyduğumuzu kanıtladı. (Pip çalışsaydı bile bu işlem ortalama 45-50 saniye sürecekti).

Uv Testi: İkinci testimde uv kullandım. Uv, ortamı saniyeler içinde izole etti ve Pandas kütüphanesini tüm alt paketleriyle birlikte sadece 7.5 saniyede (real 0m7.518s) hatasız bir şekilde kurmayı başardı.

Sonuç
Eğer donanım bağımlı devasa bir yapay zeka projesi yapmıyorsanız (Conda) veya kütüphane yayınlamayacaksanız (Poetry), standart web ve yazılım geliştirme projeleri için günümüzdeki en iyi tercih Uv'dir. Hızı, dış bağımlılık gerektirmemesi ve CI/CD süreçlerinde sağladığı zaman tasarrufu onu geleceğin standart paket yöneticisi yapmaktadır.
