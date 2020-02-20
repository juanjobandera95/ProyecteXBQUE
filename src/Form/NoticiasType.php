<?php

namespace App\Form;

use App\Entity\Categoria;
use App\Entity\Noticias;
use App\Entity\Usuarios;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class NoticiasType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title')
            ->add('datePublic',DateTimeType::class)
            ->add('content',TextareaType::class)
            ->add('summary',TextareaType::class)
            ->add('categoria',EntityType::class,['class'=>Categoria::class,'choice_label'=>'nomCategoria','multiple' =>true]);

    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Noticias::class,
        ]);
    }
}
