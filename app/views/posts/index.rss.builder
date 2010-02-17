xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", :"xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "Blog Posts"
    xml.description "Test Blog Posts"
    xml.link posts_url(:format => :rss)
    xml.atom :link, :href => posts_url(:rss), :rel => "self", :type=> "application/rss+xml"
    
    for post in @posts
      xml.item do
        xml.title post.title
        xml.description post.content
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end