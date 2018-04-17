import scrapy
from subprocess import call

class KeygenjukeboxSpider(scrapy.Spider):
    name = "keygen"

    def start_requests(self):
        urls = [
            'https://keygenjukebox.net/'
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        for line in response.xpath("//@href").extract():
            tmp = "http://keygenjukebox.net"+line
            call(["wget", tmp])        
