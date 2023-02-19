from anki_export import ApkgReader

with ApkgReader('example.apkg') as apkg:
    print(apkg.export())