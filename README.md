# NewsApp

NewsApp, NewsAPI üzerinden haberleri çekmek ve kullanıcıların arama yapmalarına, haber detaylarına bakmalarına ve favori haberlerini yönetmelerine olanak tanıyan bir iOS uygulamasıdır.

## Kullanılan Teknolojiler ve Kütüphaneler
- Swift, güncel declarative user interface SwiftUI
- MVVM mimarisi
- Repository layer
- SwiftData: Yerel veritabanı yönetimi için kullanılan kütüphane
- Alamofire: HTTP istekleri için kullanılan kütüphane
- Kingfisher: Resimleri hızlı bir şekilde indirip gösteren kütüphane

## Özellikler
- Kullanıcılar herhangi bir konu hakkında arama yapabilir ve sonuçları listeleyebilir.
- Her bir haber sonucu için resim, başlık, açıklama, tarih ve kaynak bilgisi görüntülenir.
- Haber detay sayfasında kullanıcılar haber kaynağına gitme, haber linkini paylaşma ve favorilere ekleme seçeneklerine sahiptir.
- Favori haberler ikinci bir sekmede görüntülenebilir ve detay sayfasına yönlendirilebilir.
- Dependency injection kullanımıyla esnek bir tasarım benimsenmiştir.
- SwiftData kullanılarak yerel veritabanı yönetimi yapılmaktadır.

Not: SwiftData entegre ettikten sonra build alıp model üzerinde değişiklik yaptığım için scheme tarafında Migration problemi yaşadım. Çözüm olarak debugging için -com.apple.CoreData.SQLDebug 1 ekledim ve eklenen .store dosyalarını temizledim. Farklı cihazlarda da test ettim. Clean Build ve app'i silip tekrar yüklemeyi de denedim. Fakat sağlıklı sonuca varamadım. Bilginize. 
https://stackoverflow.com/questions/77335738/swiftdata-migration-error-how-to-remove-all-data-from-xcode
