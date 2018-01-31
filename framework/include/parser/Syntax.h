//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef SYNTAX_H
#define SYNTAX_H

#include <string>
#include <map>
#include "DependencyResolver.h"
#include "FileLineInfo.h"

/**
 * Holding syntax for parsing input files
 */
class Syntax
{
public:
  struct ActionInfo
  {
    std::string _action;
    std::string _task;
  };

  Syntax();

  void registerTaskName(std::string task, bool is_required);
  void registerTaskName(std::string task, std::string moose_object_type, bool is_required);
  void appendTaskName(std::string task, std::string moose_object_type);

  void addDependency(std::string task, std::string pre_req);
  void addDependencySets(const std::string & action_sets);
  void clearTaskDependencies();

  const std::vector<std::string> & getSortedTask();
  const std::vector<std::vector<std::string>> & getSortedTaskSet();

  bool hasTask(const std::string & task);

  bool isActionRequired(const std::string & task);

  // Registration function for associating Moose Actions with syntax
  void registerActionSyntax(const std::string & action,
                            const std::string & syntax,
                            const std::string & task = "",
                            const std::string & file = "",
                            int line = -1);

  /**
   *  Registration function that replaces existing Moose Actions with a completely new action
   *  Note: This function will remove all actions associated with this piece of syntax _NOT_ just
   *        a single match of some kind
   */
  void replaceActionSyntax(const std::string & action,
                           const std::string & syntax,
                           const std::string & task,
                           const std::string & file = "",
                           int line = -1);

  /**
   * Register a type with a block. For example, associate FunctionName with the Functions block.
   * @param syntax The target syntax to associate the type with
   * @param type The name of the type to associate with the syntax
   */
  void registerSyntaxType(const std::string & syntax, const std::string & type);

  /**
   * Get a multimap of registered associations of syntax with type.
   */
  const std::multimap<std::string, std::string> & getAssociatedTypes() const
  {
    return _associated_types;
  }

  /**
   * This method deprecates previously registered syntax. You should use the exact form that you
   * want deprecated
   * in the passed in parameter.
   */
  void deprecateActionSyntax(const std::string & syntax);

  /// Returns a Boolean indicating whether the syntax has been deprecated through a call to deprecateActionSyntax
  bool isDeprecatedSyntax(const std::string & syntax) const;

  /**
   * Retrieve the syntax associated with the passed in action type string. If a task string is also
   * passed in, only syntax associated with that action+task combo will be returned.
   */
  std::vector<std::string> getSyntaxByAction(const std::string & action,
                                             const std::string & task = "");

  /**
   * Method for determining whether a piece of syntax is associated with an Action
   * TODO: I need a better name
   */
  std::string isAssociated(const std::string & real_id, bool * is_parent);

  std::pair<std::multimap<std::string, ActionInfo>::iterator,
            std::multimap<std::string, ActionInfo>::iterator>
  getActions(const std::string & name);

  const std::multimap<std::string, ActionInfo> & getAssociatedActions() const
  {
    return _syntax_to_actions;
  }

  bool verifyMooseObjectTask(const std::string & base, const std::string & task) const;

  /**
   * Gets the file and line where the syntax/action/task combo was registered.
   * @param syntax Syntax name
   * @param action Action name
   * @param task Task name
   * @return A FileLineInfo associated with the syntax/action/task triplet
   */
  FileLineInfo getLineInfo(const std::string & syntax,
                           const std::string & action,
                           const std::string & task) const;

protected:
  /// The list of registered tasks and a flag indicating whether or not they are required
  std::map<std::string, bool> _registered_tasks;

  /// The list of Moose system objects to tasks.  This map indicates which tasks are allowed to build certain MooseObjects.
  std::multimap<std::string, std::string> _moose_systems_to_tasks;

  /// The dependency resolver
  DependencyResolver<std::string> _tasks;

  /// The syntax object to ActionInfo (Action+task) associations
  std::multimap<std::string, ActionInfo> _syntax_to_actions;

  /// The ActionInfo (Action+task) to syntax associations (built only when needed)
  /// Action -> (Syntax, Task)
  std::multimap<std::string, std::pair<std::string, std::string>> _actions_to_syntax;

  /// Syntax/Type association
  std::multimap<std::string, std::string> _associated_types;

  /// Boolean indicating whether the _actions_to_syntax map is built and valid and synced
  bool _actions_to_syntax_valid;

  /// The set of deprecated syntax items
  std::set<std::string> _deprecated_syntax;

  FileLineInfoMap _syntax_to_line;
};

#endif // MOOSESYNTAX_H
