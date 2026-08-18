# CLI Egzersizleri Notları

## 1. Satır sayısını bulmak
- **Kullandığım komut:** `wc -l data/diamonds.csv`
- **Bulduğum sonuç:** 53941 

## 2. 3. kolonun tekil değerlerini frekansa göre sıralamak
- **Kullandığım komut:** `cut -d ',' -f 3 data/diamonds.csv | sort | uniq -c | sort -nr`
- **Bulduğum sonuç:** En çok tekrar eden değer 11292 frekans ile "G" oldu.

## 3. Belirli bir koşula uyan satırları filtreleyip yeni dosyaya yazmak
- **Kullandığım komut:** `grep "Premium" data/diamonds.csv > data/premium.csv`
- **Açıklama:** "Premium" verilerini süzüp bağımsız bir dosyaya aktardım.

## 4. İki farklı dosyayı birleştirmek
- **Kullandığım komut:** `cat data/diamonds.csv data/premium.csv > data/combined.csv`
- **Açıklama:** İki dosyayı `cat` komutuyla dikey olarak birleştirip tek bir dosya haline getirdim.
