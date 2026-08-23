# CLI Veri İşleme Egzersizi Notları (Ödev 1.2)

Bu belgede, sadece terminal araçları (Python kullanılmadan) kullanılarak `diamonds.csv` veri seti üzerinde gerçekleştirilen veri işleme adımları ve komutları yer almaktadır. İşlemlerin güvenilirliğini sağlamak adına her veri manipülasyonu sonrasında `wc -l` ile çıktı kontrolü (sanity check) yapılmıştır.

## 1. Satır sayısını bulmak
**Kullandığım komut:**
`wc -l data/diamonds.csv`

**Bulduğum sonuç:** Toplam 53941 satır.

## 2. 3. kolonun tekil değerlerini frekansa göre sıralamak
**Kullandığım komut:**
`cut -d ',' -f 3 data/diamonds.csv | sort | uniq -c | sort -nr`

**Bulduğum sonuç:** En çok tekrar eden değer 11292 frekans ile "G" oldu.

## 3. Belirli bir koşula uyan satırları filtreleyip yeni dosyaya yazmak
**Kullandığım komutlar:**
`awk -F',' '$2 == "\"Premium\""' data/diamonds.csv > data/premium.csv`
`wc -l data/premium.csv`

**Bulduğum sonuç:** İkinci sütundaki çift tırnaklı değerler doğru hedef alınarak komut başarıyla çalıştırıldı ve `wc -l` ile 13791 satır "Premium" elmas verisinin süzüldüğü doğrulandı.

## 4. İki farklı dosyayı birleştirmek
**Kullandığım komutlar:**
Gerçek bir veri birleştirme senaryosu kurgulamak adına öncelikle "Ideal" kesim elmaslar ayrı bir dosyaya süzüldü. Ardından `join` komutunun ön koşulu gereği her iki dosya da ortak anahtar sütununa (Karat - 1. Sütun) göre sıralandı:

`awk -F',' '$2 == "\"Ideal\""' data/diamonds.csv > data/ideal.csv`
`sort -t ',' -k1,1 data/premium.csv > data/premium_sorted.csv`
`sort -t ',' -k1,1 data/ideal.csv > data/ideal_sorted.csv`

Sıralanmış bu iki bağımsız dosya, karat değerleri üzerinden birleştirildi ve sonucun boş dönmediği kontrol edildi:

`join -t ',' -1 1 -2 1 data/premium_sorted.csv data/ideal_sorted.csv > data/joined_diamonds.csv`
`wc -l data/joined_diamonds.csv`

**Bulduğum sonuç:** `join` komutu ile aynı alt kümeye ait olmayan iki farklı (ve sıralanmış) dosya ortak anahtar üzerinden başarıyla birleştirildi ve sessiz hata (silent failure) riskine karşı üretilen satır sayısı kontrol edildi.
