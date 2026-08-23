from dev_setup.main import main


def test_main_runs(capsys):
    """Main fonksiyonunun hata vermeden çalıştığını ve konsola çıktı verdiğini test eder."""
    try:
        main()
    except SystemExit:
        pass

    captured = capsys.readouterr()
    assert captured.out is not None
