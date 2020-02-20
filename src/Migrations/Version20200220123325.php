<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200220123325 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE usuarios ADD CONSTRAINT FK_EF687F25E5C27E9 FOREIGN KEY (iduser) REFERENCES noticias (author_id)');
        $this->addSql('ALTER TABLE noticia_categoria DROP FOREIGN KEY FK_6ABC1CC44B89032C');
        $this->addSql('ALTER TABLE noticia_categoria DROP FOREIGN KEY FK_6ABC1CC4BAD26311');
        $this->addSql('ALTER TABLE noticia_categoria ADD CONSTRAINT FK_95B0098999926010 FOREIGN KEY (noticia_id) REFERENCES noticias (idnews)');
        $this->addSql('ALTER TABLE noticia_categoria ADD CONSTRAINT FK_95B009893397707A FOREIGN KEY (categoria_id) REFERENCES categoria (id_categoria)');
        $this->addSql('ALTER TABLE noticia_categoria RENAME INDEX noticia_id TO IDX_95B0098999926010');
        $this->addSql('ALTER TABLE noticia_categoria RENAME INDEX categoria_id TO IDX_95B009893397707A');
        $this->addSql('ALTER TABLE comentario CHANGE author_id author_id INT DEFAULT NULL, CHANGE idComentario idComentario INT NOT NULL');
        $this->addSql('ALTER TABLE comentario ADD CONSTRAINT FK_4B91E702C965F9E8 FOREIGN KEY (idComentario) REFERENCES noticias (idnews)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE comentario DROP FOREIGN KEY FK_4B91E702C965F9E8');
        $this->addSql('ALTER TABLE comentario CHANGE author_id author_id INT NOT NULL, CHANGE idComentario idComentario INT AUTO_INCREMENT NOT NULL');
        $this->addSql('ALTER TABLE noticia_categoria DROP FOREIGN KEY FK_95B0098999926010');
        $this->addSql('ALTER TABLE noticia_categoria DROP FOREIGN KEY FK_95B009893397707A');
        $this->addSql('ALTER TABLE noticia_categoria ADD CONSTRAINT FK_6ABC1CC44B89032C FOREIGN KEY (noticia_id) REFERENCES noticias (idnews) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE noticia_categoria ADD CONSTRAINT FK_6ABC1CC4BAD26311 FOREIGN KEY (categoria_id) REFERENCES categoria (id_categoria) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE noticia_categoria RENAME INDEX idx_95b0098999926010 TO noticia_id');
        $this->addSql('ALTER TABLE noticia_categoria RENAME INDEX idx_95b009893397707a TO categoria_id');
        $this->addSql('ALTER TABLE usuarios DROP FOREIGN KEY FK_EF687F25E5C27E9');
    }
}
