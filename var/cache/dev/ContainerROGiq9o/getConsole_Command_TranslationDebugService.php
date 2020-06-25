<?php

namespace ContainerROGiq9o;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getConsole_Command_TranslationDebugService extends App_KernelDevDebugContainer
{
    /**
     * Gets the private 'console.command.translation_debug' shared service.
     *
     * @return \Symfony\Bundle\FrameworkBundle\Command\TranslationDebugCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        $container->privates['console.command.translation_debug'] = $instance = new \Symfony\Bundle\FrameworkBundle\Command\TranslationDebugCommand(($container->services['translator'] ?? $container->getTranslatorService()), ($container->privates['translation.reader'] ?? $container->load('getTranslation_ReaderService')), ($container->privates['translation.extractor'] ?? $container->load('getTranslation_ExtractorService')), 'C:\\my-project/translations', 'C:\\my-project/templates', [0 => 'C:\\my-project\\vendor\\symfony\\validator/Resources/translations', 1 => 'C:\\my-project\\vendor\\symfony\\form/Resources/translations', 2 => 'C:\\my-project\\vendor\\symfony\\security-core/Resources/translations'], [0 => 'C:\\my-project\\vendor\\symfony\\twig-bridge/Resources/views/Email', 1 => 'C:\\my-project\\vendor\\symfony\\twig-bridge/Resources/views/Form', 2 => 'C:\\my-project\\vendor\\symfony\\framework-bundle\\Command\\TranslationDebugCommand.php', 3 => 'C:\\my-project\\vendor\\symfony\\form\\Extension\\Core\\Type\\FileType.php', 4 => 'C:\\my-project\\vendor\\symfony\\form\\Extension\\Core\\Type\\ColorType.php', 5 => 'C:\\my-project\\vendor\\symfony\\form\\Extension\\Core\\Type\\TransformationFailureExtension.php', 6 => 'C:\\my-project\\vendor\\symfony\\form\\Extension\\Validator\\Type\\UploadValidatorExtension.php', 7 => 'C:\\my-project\\vendor\\symfony\\form\\Extension\\Csrf\\Type\\FormTypeCsrfExtension.php', 8 => 'C:\\my-project\\vendor\\symfony\\validator\\ValidatorBuilder.php', 9 => 'C:\\my-project\\vendor\\symfony\\framework-bundle\\CacheWarmer\\TranslationsCacheWarmer.php', 10 => 'C:\\my-project\\vendor\\symfony\\translation\\DataCollector\\TranslationDataCollector.php', 11 => 'C:\\my-project\\vendor\\symfony\\twig-bridge\\Extension\\TranslationExtension.php']);

        $instance->setName('debug:translation');

        return $instance;
    }
}
