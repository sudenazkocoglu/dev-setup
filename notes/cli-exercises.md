# CLI Veri İşleme Egzersizi Notları (Ödev 1.2)

Bu belgede, sadece terminal araçları (Python kullanılmadan) kullanılarak `diamonds.csv` veri seti üzerinde gerçekleştirilen veri işleme adımları ve komutları yer almaktadır.

## 1. Satır sayısını bulmak
**Kullandığım komut:**
`wc -l data/diamonds.csv`

**Bulduğum sonuç:** Toplam 53941 satır.

## 2. 3. kolonun tekil değerlerini frekansa göre sıralamak
**Kullandığım komut:**
`cut -d ',' -f 3 data/diamonds.csv | sort | uniq -c | sort -nr`

**Bulduğum sonuç:** En çok tekrar eden değer 11292 frekans ile "G" oldu.

## 3. Belirli bir koşula uyan satırları filtreleyip yeni dosyaya yazmak
**Kullandığım komut:**
`awk -F',' '$1 == "Premium"' data/diamonds.csv > data/premium.csv`

**Bulduğum sonuç:** İçerisinde "Premium" geçen verileri süzüp bağımsız bir dosyaya aktardım.

## 4. İki farklı dosyayı birleştirmek
**Kullandığım komut:**
`join -t',' -1 1 -2 1 data/diamonds.csv data/premium.csv > data/birlestirilmis_veri.csv`

**Bulduğum sonuç:** `join` komutu kullanılarak ortak anahtar sütun üzerinden iki dosya başarıyla birleştirildi.
