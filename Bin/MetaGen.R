library("vegan")
library("phyloseq")
library("ggplot2")
library("dplyr")

suelo<-import_biom("../Data/taxonomy.biom")

OUT<-as.data.frame(otu_table(suelo))
OUT<-decostand(OUT, method="pa")


OUT<-otu_table(OUT, taxa_are_rows = TRUE)
TAX <- tax_table(suelo)
sampledata<- sample_data(suelo)
physeq<-phyloseq(OUT,TAX,sampledata)

physeq

colnames(tax_table(physeq))<-c("Domain","Phylum","Class","Order","Famlily","Genus","Species")

no.reads<-sort(sample_sums(physeq))
no.reads

p<-plot_bar(physeq,"Host",fill = "Phylum")+ geom_bar(aes(color=Phylum,fill=Phylum),stat="identity",position="stack") 
p + facet_wrap("Treatment") 

diversity<-estimate_richness(physeq,measures=c("Observed","Fisher"))
data<-cbind(sample_data(physeq),diversity)

host<-aov(Observed ~ Treatment + Host, data=data)
summary.aov(host)
boxplot(Observed ~ Treatment + Host, data=data)


raup<-distance(physeq, method="raup")
raup

NMDS<-ordinate(physeq,method = "NMDS", distnace="raup")
NMDS
p<-plot_ordination(physeq,NMDS,color="Host")
p +facet_wrap("Treatment")+ geom_point(size=3)+ theme_linedraw()

adonis(bray~Host+Treatment,data=data)



