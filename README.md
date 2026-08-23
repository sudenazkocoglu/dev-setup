# dev-setup - Ödev 1.1

[![CI](https://github.com/sudenazkocoglu/dev-setup/actions/workflows/ci.yml/badge.svg)](https://github.com/sudenazkocoglu/dev-setup/actions/workflows/ci.yml)

> Yapay Zeka ve Veri Mühendisliği projeleri için standart proje şablonu.

## Proje Hakkında
Bu repo; Python projeleri için standart bir geliştirme ortamı, `pre-commit` kancaları, kod kalitesi araçları (`ruff`, `mypy`) ve otomatik test/CI boru hattı (GitHub Actions) yapılandırmasını içerir.

## Özellikler

* **Paket Yöneticisi:** `uv` ile yüksek performanslı bağımlılık yönetimi ve hızlı sanal ortam kurulumu.
* **Kod Kalitesi ve Linting:** `ruff` (hızlı linter ve formatlayıcı) ve `mypy` (statik tip denetimi) entegrasyonu.
* **Otomasyon:** `Makefile` yardımıyla tek komutla kurulum, test ve lint işlemlerini çalıştırma imkanı.
* **Ön Kancalar (Pre-commit):** Kod kalitesi ve biçimlendirme kurallarını commit öncesi otomatik denetleyen yapılandırma.
* **CI/CD Boru Hattı:** GitHub Actions üzerinden her `push` ve `pull_request` işleminde otomatik test ve lint doğrulama.

## Nasıl Çalıştırılır

Projeyi yerelinizde kurmak ve test etmek için:

```bash
make install
make test
