xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "Nagy Bianka"
  xml.id "http://nagybianka.eu/"
  xml.link "href" => "http://nagybianka.eu/"
  xml.link "href" => "http://nagybianka.eu/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Nagy Bianka" }
  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Nagy Bianka" }
      xml.content article.body, "type" => "html"
    end
  end
end
